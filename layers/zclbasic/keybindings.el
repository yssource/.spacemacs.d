(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "C-3") 'query-replace) ;询问替换

(global-set-key [f9] 'undo)

(global-set-key "\C-c\;" 'comment-or-uncomment-region)
(global-set-key "\C-c\C-k" 'kill-region)

(spacemacs/set-leader-keys "fn" 'find-file)
(spacemacs/set-leader-keys "fp" 'ffap)
(global-set-key (kbd "C-x b") 'eshell)
(global-set-key (kbd "M-SPC") 'set-mark-command)

(global-set-key [f4] 'helm-projectile-grep)

(set-register ?i (cons 'file "~/zorg/zcl.space/index.org"))
;; define-key copied  from the init.el
(define-key evil-motion-state-map "j" 'evil-next-visual-line)
(define-key evil-motion-state-map "k" 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "C-e") 'end-of-line)
(define-key evil-motion-state-map (kbd "C-q") 'undo-tree-visualize)
;; Also in visual mode
(define-key evil-visual-state-map "j" 'evil-next-visual-line)
(define-key evil-visual-state-map "k" 'evil-previous-visual-line)
(define-key evil-visual-state-map (kbd "C-e") 'end-of-line)
(define-key evil-visual-state-map (kbd "C-q") 'undo-tree-visualize)
(spacemacs/set-leader-keys "fn" 'find-file)
(spacemacs/set-leader-keys "fp" 'ffap)
(spacemacs/set-leader-keys "oe" 'open-in-desktop)
(spacemacs/set-leader-keys "bc" 'whitespace-cleanup)
(spacemacs/set-leader-keys "fw" 'ido-write-file)
(spacemacs/set-leader-keys "fd" 'open-in-desktop)
(spacemacs/set-leader-keys "ss" 'spacemacs/helm-swoop-region-or-symbol)
(spacemacs/set-leader-keys "sS" 'helm-swoop)
(spacemacs/set-leader-keys "by" 'spacemacs/copy-whole-buffer-to-clipboard)
(spacemacs/set-leader-keys "fi" (lambda() (interactive)(find-file "~/zorg/zcl.space/index.org")))
(define-key evil-insert-state-map (kbd "C-a") 'beginning-of-line)

(define-key evil-insert-state-map (kbd "C-d") 'delete-char)
(define-key evil-insert-state-map (kbd "C-e") 'end-of-line)
(define-key evil-insert-state-map (kbd "C-p") 'previous-line)
(define-key evil-insert-state-map (kbd "C-n") 'next-line)
(define-key evil-insert-state-map (kbd "C-k") 'kill-line)
(define-key evil-insert-state-map (kbd "C-k") nil)
(define-key evil-insert-state-map (kbd "C-q") 'undo-tree-visualize)
(define-key evil-insert-state-map (kbd "C-r") 'undo-tree-undo)

;;(define-key evil-insert-state-map (kbd "C-t") 'undo-tree-redo)
;;(global-unset-key (kbd "C-k"))
(define-key evil-insert-state-map (kbd "C-y") 'yank)
(define-key evil-insert-state-map (kbd "C-v") 'scroll-up-command)
(define-key evil-insert-state-map (kbd "C-w") 'kill-region)
(define-key evil-insert-state-map (kbd "M-y") 'helm-show-kill-ring)
(define-key evil-normal-state-map "Q" 'evil-ex)
(define-key evil-normal-state-map (kbd "C-i") 'evil-jump-forward)
(define-key evil-normal-state-map "\'" 'save-buffer)
(define-key evil-normal-state-map "’" 'save-buffer)
(define-key evil-normal-state-map "‘" 'save-buffer)
(define-key evil-normal-state-map (kbd "RET") 'save-buffer)
