; C-x l = goto line
(global-set-key "\C-xl" `goto-line)

(setq select-active-regions t)
(transient-mark-mode 1)

; Don't display splash screen
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

; Get rid of that pesky toolbar too
(if window-system
    (tool-bar-mode -1))

; I don't like tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(add-hook 'python-mode-hook '(lambda ()
                               (setq python-indent 2)))
(setq js-indent-level 2)

; Set PATH and eval-path
(let ((path (shell-command-to-string "source /home/$USER/.zshrc 2>/dev/null; echo -n $PATH")))
 (setenv "PATH" path)
 (setq exec-path
      (append
       (split-string-and-unquote path ":")
       exec-path)))

; Bells suck
(setq visible-bell t)

; Stop loading buffers with <2>, <3>, etc. Give them a good name
; http://www.gnu.org/software/emacs/manual/html_node/emacs/Uniquify.html
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

; Store baackups in a dedicated directory rather than clutter my workspace
(defun make-backup-file-name (file)
(concat "~/.emacs.d/backups/" (file-name-nondirectory file) "~"))

; display line numbers in margin (fringe). Emacs 23 only.
(global-linum-mode 1)

; Text by default
(setq initial-major-mode 'text-mode)

; Delete trailing whitespace by default
(add-hook 'before-save-hook 'delete-trailing-whitespace)
