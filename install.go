package main

import (
	"encoding/json"
	"errors"
	"flag"
	"fmt"
	"io/fs"
	"os"
	"path/filepath"
	"strings"
)

var (
	oConfigPath = flag.String("config", "./config.json", "path to the config file")
)

type Config map[string]Profile

type Profile map[string]App

type App struct {
	Files []ConfigFile `json:"files"`
}

type ConfigFile struct {
	Src string `json:"src"`
	Dst string `json:"dst"`
}

func main() {
	flag.Parse()

	if err := run(); err != nil {
		fmt.Println(err.Error())
		os.Exit(1)
	}
}

func run() error {
	config, err := loadConfig(*oConfigPath)
	if err != nil {
		return err
	}

	defaultProfile, ok := config["default"]
	if !ok {
		return errors.New("missing default profile")
	}

	err = linkProfileFiles("default", defaultProfile)
	if err != nil {
		return err
	}

	if flag.NArg() == 0 {
		return nil
	}

	profile := flag.Arg(0)
	profileConfig, ok := config[profile]
	if !ok {
		return fmt.Errorf("profile '%s' not found", profile)
	}

	err = linkProfileFiles(profile, profileConfig)
	if err != nil {
		return err
	}

	return nil
}

func loadConfig(path string) (Config, error) {
	f, err := os.Open(*oConfigPath)
	if err != nil {
		return Config{}, fmt.Errorf("failed to open config: %w", err)
	}

	var config Config
	err = json.NewDecoder(f).Decode(&config)
	if err != nil {
		return Config{}, err
	}

	home, err := os.UserHomeDir()
	if err != nil {
		return Config{}, err
	}

	cwd, err := os.Getwd()
	if err != nil {
		return Config{}, err
	}

	for profile, pConf := range config {
		for app, conf := range pConf {
			for i, file := range conf.Files {
				config[profile][app].Files[i].Src = filepath.Join(cwd, file.Src)
				config[profile][app].Files[i].Dst = resolveDstPath(home, file.Dst)
			}
		}
	}

	return config, nil
}

func linkProfileFiles(profileName string, config Profile) error {
	for appName, app := range config {
		for _, file := range app.Files {
			err := createDir(file.Dst)
			if err != nil {
				fmt.Printf("failed to create directory: %v\n", err)
				continue
			}

			err = os.Symlink(file.Src, file.Dst)
			if errors.Is(err, fs.ErrExist) {
				fmt.Printf(
					"%s::%s::%s already exists, skipping\n",
					profileName, appName, file.Dst,
				)
			} else if err != nil {
				fmt.Printf("failed to create symlink: %v\n", err)
			}
		}
	}

	return nil
}

func resolveDstPath(home, path string) string {
	if path == "~" {
		path = home
	} else if strings.HasPrefix(path, "~") {
		path = filepath.Join(home, path[2:])
	}

	return filepath.Clean(path)
}

func createDir(path string) error {
	return os.MkdirAll(filepath.Dir(path), 0776)
}
