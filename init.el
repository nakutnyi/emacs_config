;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (deeper-blue))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;the below should be fixed (currently gives errors):
;(load-file "~/.emacs.d/init.el")

;my custom changes
(setq show-paren-delay 0)
(show-paren-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
;(autoload 'ibuffer "ibuffer" "List buffers." t)
;(setq-default indent-tabs-mode t)
;(setq-default tab-width 4) ; Assuming you want your tabs to be four spaces wide
;(defvaralias 'c-basic-offset 'tab-width)

;(add-hook 'c-mode-common-hook
;    (lambda ()
;      (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
;  (ggtags-mode 1))))


;(add-hook 'dired-mode-hook 'ggtags-mode)

(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

;auto-indent yanked code
(dolist (command '(yank yank-pop))
   (eval `(defadvice ,command (after indent-region activate)
            (and (not current-prefix-arg)
                 (member major-mode '(emacs-lisp-mode lisp-mode
                                                      clojure-mode    scheme-mode
                                                      haskell-mode    ruby-mode
                                                      rspec-mode      python-mode
                                                      c-mode          c++-mode
                                                      objc-mode       latex-mode
                                                      plain-tex-mode))
                 (let ((mark-even-if-inactive transient-mark-mode))
                   (indent-region (region-beginning) (region-end) nil))))))

;Set keys
(global-set-key (kbd "C-c t") 'bookmark-insert)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(put 'upcase-region 'disabled nil)
