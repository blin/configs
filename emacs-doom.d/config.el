;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Evgenii Petrov"
      user-mail-address "blinunleis@gmail.com")

(setq doom-theme 'doom-dracula)

(setq display-line-numbers-type t)

(map! :i "C-c" #'evil-force-normal-state)
