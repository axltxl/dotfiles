;; evil leader key setup via general.el
;; -----------------------
;; Define leader key
(defconst axltxl/leader-key "SPC")
(use-package general
  :config
  ;;(general-evil-setup)
  (general-create-definer axltxl/general-leader-def :prefix axltxl/leader-key))

;; Prefix definition
;; TODO document me if it comes to that
(defun axltxl/define-key (key ecmd &rest keydefs)
  (axltxl/general-leader-def
    :keymaps 'override
    :states '(normal visual emacs)
    key ecmd)
  (if keydefs (apply 'axltxl/define-key keydefs)))
