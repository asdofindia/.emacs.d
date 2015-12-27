# .emacs.d

This is my Emacs configuration which uses use-package.

## custom.el
`$ cat ~/.emacs.d/custom.el`
```lisp
(custom-set-variables
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(custom-file "custom.el")
 '(jekyll-directory (quote "/home/user/blog_directory/")))
(custom-set-faces)
```


## Thanks

* [Jaseem Abid](https://github.com/jaseemabid/emacs.d/)
* [Jack Moffitt](https://github.com/metajack/jekyll/blob/master/emacs/jekyll.el)