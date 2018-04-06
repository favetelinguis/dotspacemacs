;; General stuff
(defun spacemacs//java-setup-backend ()
  "Conditionally setup java backend."
  (pcase java-backend
    (`lsp (spacemacs//java-setup-lsp))))

(defun spacemacs//java-setup-company ()
  "Conditionally setup company based on backend."
  (pcase java-backend
    (`lsp (spacemacs//java-setup-lsp-company))))

;; lsp specific
(defun spacemacs//java-setup-lsp ()
  "Setup lsp backend."
  (if (configuration-layer/layer-used-p 'lsp)
      (progn
        (require 'lsp-java)
        (lsp-java-enable))
    (message "`lsp' layer is not installed, please add `lsp' layer to your dofile.")))

(defun spacemacs//java-setup-lsp-company ()
  "Setup lsp auto-completion."
  (if (configuration-layer/layer-used-p 'lsp)
      (progn
        (spacemacs|add-company-backends
          :backends company-lsp
          :modes java-mode)
        (company-mode))
    (message "`lsp' layer is not installed, please add `lsp' layer to your dofile.")))
