#lang racket/base

;; Utilities for autobib

(require scribble/manual
         scriblib/autobib
         (for-syntax racket/list
                     racket/syntax
                     syntax/parse))

(provide (all-defined-out))

(define-syntax (define-bib stx)
  (syntax-parse stx
    [(_ name bib-expr) #'(define name bib-expr)]
    [(_ (name ...) bib-expr)
     (define name# (length (syntax->list #'(name ...))))
     (define bibs (make-list name# #'bib))
     #`(define-values (name ...)
         (let ([bib bib-expr])
           (values #,@bibs)))]))

(define short-autobib-location? (make-parameter #f))
(define-syntax define/short
  (syntax-rules ()
    [(_ i e e*) (define i (if (short-autobib-location?) e e*))]
    [(_ i e) (define i e)]))

(define IEEE "IEEE ")
(define ACM "ACM ")
(define International "Intl. ")
(define Conference "Conf. ")
(define Workshop "Wksp. ")
(define Journal "J. ")
(define Symposium "Sym. ")
(define Transactions "Trans. ")

(define/short asplas "APLAS" (string-append "Asian " Symposium "Programming Languages and Systems"))
(define/short fpca "FPCA" (string-append ACM International Conference "Functional Programming Languages and Computer Architecture"))
(define/short icfp "ICFP" (string-append ACM International Conference "Functional Programming"))
(define/short pldi "PLDI" (string-append ACM Conference "Programming Language Design and Implementation"))
(define/short popl "POPL" (string-append ACM Symposium "Principles of Programming Languages"))
(define/short lncs "LNCS" "Lecture Notes in Computer Science")
(define/short sigplan-notices "SIGPLAN Notices" (string-append ACM "SIGPLAN Notices"))
(define/short scheme-workshop "SFP" (string-append Workshop "Scheme and Functional Programming"))
(define/short ml-workshop "ML" (string-append Workshop "on ML"))
(define/short jfp "JFP" (string-append Journal "Functional Programming"))
(define/short hosc "HOSC" "Higher-Order and Symbolic Programming")
(define/short lfp "LFP" "LISP and Functional Programming")
(define/short lsc "LSC" "LISP and Symbolic Computation")
(define/short ifl "IFL" (string-append International Symposium "Functional and Logic Programming"))
(define/short tfp "TFP" (string-append Symposium "Trends in Functional Programming"))
(define/short ecoop "ECOOP" (string-append "European " Conference "Object-Oriented Programming"))
(define/short oopsla "OOPSLA" (string-append ACM Conference "Object-Oriented Programming, Systems, Languages and Applications"))
(define/short ieee-software (string-append IEEE "Software"))
(define/short toplas "TOPLAS" (string-append Transactions "Programming Languages and Systems"))
(define/short dls "DLS" "Dynamic Languages Symposium")
(define/short flops "FLOPS" (string-append Symposium "Functional and Logic Programming"))
(define/short esop "ESOP" (string-append "European " Symposium "on Programming"))
(define/short iclp "ICLP" (string-append  International Conference "on Logic Programming"))
(define/short fse "FSE" (string-append International Symposium "on the Foundations of Software Engineering"))
(define/short aosd "AOSD" (string-append International Conference "on Aspect-Oriented Software Development"))
(define/short foal "FOAL" "Foundations of Aspect-Oriented Languages")
(define/short tlca "TLCA" (string-append International Conference "Typed Lambda Calculi and Applications"))
(define/short i&c "Info. & Comp." "Information and Computation")

