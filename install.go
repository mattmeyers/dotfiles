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

type Config map[string]App

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

    for appName, app := range config {
        for _, file := range app.Files {
            err = createDir(file.Dst)
            if err != nil {
                fmt.Printf("failed to create directory: %v\n", err)
                continue
            }

            err = os.Symlink(file.Src, file.Dst)
            if errors.Is(err, fs.ErrExist) {
                fmt.Printf("%s::%s already exists, skipping\n", appName, file.Dst)
            } else if err != nil {
                fmt.Printf("failed to create symlink: %v\n", err)
            }
        }
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

    for app, conf := range config {
        for i, file := range conf.Files {
            config[app].Files[i].Src = filepath.Join(cwd,file.Src)
            config[app].Files[i].Dst = resolveDstPath(home, file.Dst)
        }
    }

    return config, nil
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

