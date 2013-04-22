; C-x l = goto line
(global-set-key "\C-xl" `goto-line)

(setq select-active-regions t)
(transient-mark-mode 1)

; Don't display splash screen
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

; Get rid of that pesky toolbar too
(tool-bar-mode -1)

; I don't like tabs
(setq-default indent-tabs-mode nil)

; Ruby-mode stuff
(eval-after-load 'ruby-mode
  '(progn
     ;; work around possible elpa bug
     (ignore-errors (require 'ruby-compilation))
     (setq ruby-use-encoding-map nil)
     (add-hook 'ruby-mode-hook 'inf-ruby-keys)
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
     (define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)
     (define-key ruby-mode-map (kbd "C-c l") "lambda")))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))


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

; Javascript indentation to 2 spaces
(setq js-indent-level 2)

; Text by default
(setq initial-major-mode 'text-mode)

; Delete trailing whitespace by default
(add-hook 'before-save-hook 'delete-trailing-whitespace)

