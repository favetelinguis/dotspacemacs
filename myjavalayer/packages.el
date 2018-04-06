;;; packages.el --- myjavalayer layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: nze920 <nze920@nze920-client>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq myjavalayer-packages
      '(
        (lsp-java :requires lsp-mode)))

(defun myjavalayer/init-lsp-java ()
  (use-package lsp-java
    :commands lsp-java-enable))

(defun myjavalayer/post-init-company ()
  ;; backend specific
  (add-hook 'java-mode-hook #'spacemacs//java-setup-company)
  (spacemacs|add-company-backends
    :backends (company-files company-capf)
    :modes java-mode
    :variables
    company-minimum-prefix-length 0
    company-idle-delay 0.5))

(defun python/post-init-flycheck ()
  (spacemacs/enable-flycheck 'java-mode))

;(defun myjavalayer/init-myjavalayer
;    (use-package myjavalayer
;      :defer t
;      :init
;      (progn
;        (message "Init java hook shit")
;        (spacemacs/add-to-hook 'java-mode-hook
;                               ('spacemacs//java-setup-backend)))))


;;; packages.el ends here
