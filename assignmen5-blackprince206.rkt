;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname assignmen5-blackprince206) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
Problem 1

1.	Provide a Data Definition for a list of Booleans (LoB)

;; Signature:  
;; cs-align-student?  :  undergrad major  ->  boolean
;; to determine whether graduates of an-undergrad-program will be accepted
;; as traditional computer science (cs) students or as cs align students
   (define (cs-align student?  an-undergrad-major) ...)


;;;; Data Definitions:
;; A CS Align Student 

;;;; Examples:
;; (cs-align-student? Chemistry) true)
;; (cs-align-student? Philisophy) true)
;; (cs-align-student? Computer Science) false)

;; Tests:
(check-expect (boolean=? (cs-align-student? Chemistry) true))
(check-expect (boolean=? (cs-align-student? Philisophy) true))
(check-expect (boolean=? (cs-align-student? Computer Science) false))


2.	Design the function lob-or that consumes a list of booleans and returns the result of logically or-ing all the elements of the list. For example 
3.	;; (lob-or (cons #true (cons #false (cons #true empty)))) is equivalent to
4.	;; (or #true #false #true)
5.	(lob-or (cons #true (cons #false (cons #true empty))))   ;; returns #true
6.	(lob-or (cons #false (cons #false (cons #false empty)))) ;; returns #false
                        
7.	Design the function lob-and that consumes a list of booleans and returns the result of logically and-ing all the elements of the list. For example 
8.	;; (lob-and (cons #true (cons #false (cons #true empty)))) is equivalent to 
9.	;; (and #true #false #true)
10.	(lob-and (cons #true (cons #false (cons #true empty)))) ;; returns #false
11.	(lob-and (cons #true (cons #true (cons #true empty))))  ;; returns #true
                        
Problem 2
1.	Privide the Data Definition for a list of Strings (LoS) 
2.	Design the function los-total-length that consumes a list of Strings and returns the sum of the length of each element in the list. For example 
3.	(los-total-length (cons "a" empty))             ;; returns 1
4.	(los-total-length (cons "aa" (cons "a" empty))) ;; returns 3
                        
5.	Design the function los-contains that consumes a list of Strings string-list and a String s and returns true if s is in string-list, otherwise returns false. 
6.	Design the function los-replace-first that consumes a list of Strings string-list and two Strings old and new and returns the string-list but with the first old replaced by new. For example 
7.	 (los-replace-first (cons "a" (cons "b" (cons "a" empty))) "a" "x") 
8.	;; returns 
9.	;; (cons "x" (cons "b" (cons "a" empty)))
10.	
11.	(los-replace-first (cons "a" (cons "b" (cons "a" empty))) "c" "x") 
12.	;; returns 
13.	;; (cons "a" (cons "b" (cons "a" empty))) 
 
14.	Design the function los-replace-all that consumes a list of Strings string-list and two Strings old and new and returns the string-list but with all old replaced by new. For example 
15.	 (los-replace-all (cons "a" (cons "b" (cons "a" empty))) "a" "x") 
16.	;; returns 
17.	;; (cons "x" (cons "b" (cons "x" empty)))
18.	
19.	(los-replace-all (cons "a" (cons "b" (cons "a" empty))) "c" "x") 
20.	;; returns 
21.	;; (cons "a" (cons "b" (cons "a" empty)))


 
Problem 3
You are helping out a team that is building software for a new cash register. The team has the following incomplete Data Definitions. 

;; An Id is a Symbol
;; INTERP: represents a product's id 

;; A Name is a String 
;; INTERP: represents the product's name 

;; Dollars is a PosInteger
;; INTERP: represents the amount of dollars for a price

;; Cents is a NonNegInteger 
;; WHERE: Cents is greater or equal to 0 
;;        and less or equal to 99
;; INTERP: represents the amount of cents for a price

(define-struct price [dollars cents])
;; An Price is (make-price Dollars Cents)
;; INTERP: represents total amount in dollars and cents. 

;; A Quantity is a PosInteger
;; INTERP: represent the number of items 

(define-struct line-item [id name price quantity])
;; A LineItem is a (make-line-item Id Name Price Quantity)
;; INTERP: represents a line item with the products id, name price and 
;;         quantity 
 
1.	Provide a Data Definition for a list of LineItems 
2.	Design the function bill-total that consumes a list of LineItems and returns the total amount
   for the list of items.

;;;; PART-1

(list 1 2 3)
   = (cons spaghetti (cons lettuce (cons corn empty)))

;;A  (List-of-LineItems) is one of
;; - empty
;; - (cons LineItem List-of-LineItems)

;;;; Template
;; list-of-lineitems-fn: List-of-LineItems -> ???
#;(define (list-of-lineitems-fn a-list)
    (cond
      [(empty? a-list) ...]
      [(cons? a-list) ... (lineitem-fn (first a-list)) ...
                       ... (list-of-lineitems-fn (rest a-list))...]))

;;;; Template
;; Signature
;; lineitem-fn : lineitem -> ???
;; (define (lineitem-fn an-item)) 
;;       ... (lineitem-id an-item)...
;;       ... (lineitem-name an-item) ...
;;       ... (lineitem-price an-item) ...)
;;       ... (lineitem-quantity an-item) ...)



;;;; PART-2

;;;; Signature:
;; bill-total : LineItems  ->  TotalAmount
;; to compute the total amount for list of line items purchased at a grocery store

  (define (bill-total lineitems)
      (cond
      [(empty? lineitems) 0]
      [(cons? lineitems)   (add-prices (price-quantity (first a-list))
                           (bill-total (rest a-list)))]))
       
  (define (price-quantity item)

        (make-price (*(price-dollars
        (lineitem-price item))
        (lineitem-quantity item))

        (*(price-cents
        (lineitem-price item))
        (lineitem-quantity item))))

        (define (price-adjuster a-price)
                (make-price (+ (price-dollars a-price)

                (floor (/(price-cents a-price)100)))
                (- (price-cents a-price) (*(floor (/(price-cents a-price) 100)) 100))))
           
         (define (add-prices first second)
                 (price-adjuster (make-price (+ (price-dollars first)
                                 (price-dollars second))
                 
                                  (+ (price-cents first)
                                  (price-cents second)))))


Problem 4

;;;; You are helping out a professor with calculating end of term grades. The professor has been
;;;; keeping student grades using the following Data Definition. 

;; An Id is a Symbol
;; INTERP: represents the student's id

;; An Email is a String 
;; INTERP: represents an email address

;; A Grade is a NonNegativeInteger
;; WHERE: Grade is in the range [0, 100]
;; INTERP: represents the grade given to a student for an assignment 

;; A GradeList is one of 
;;  - empty
;;  - (cons Grade GradeList)

(define-struct student [id email grades])
;; A Student is (make-student Id Email GradeList)
;; INTERP: represents a student with the student's id 
;;         the student's email and a list of all their grades

;; A Class is one of 
;;  - empty
;;  - (cons Student Class)
 
;;;; 1. Design the function student-average that consumes a student and returns the average grade for
;;;;    that student 

;;;; 2. Design the method class-finals that consumes a class (a list of students) and returns a list
;;;;    with each students average grade. 


;;;; Examples:

;;;; Data Definitions:
;;;; Signature:
;;;; Template:
;;;; Examples:
;;;; Function Definition:
;;;; Tests:


Problem 5
A friend is trying to write a small game but they are stuck at the moment and they are asking for your help. Here is what code they have so far 

;; A Direction is one of 
;;  - 'up
;;  - 'down
;;  - 'left
;;  - 'right

(define-struct bullet [location radius direction speed])
;; A Bullet is (make-bullet Posn PosInt Direction PosInt)
;; INTERP: represents a bullet with its current location, 
;;         the bullet's radius, the bullet's direction and 
;;         the bullet's speed
                    
                
They are asking for your help in order to 
1.	Define a Data Definition for a list of bullets 
2.	Design a function called bullets-draw that consumes a list of bullets and draws the bullets on a 800x500 canvas 
3.	Design a function called bullets-move that consumes a list of bullets and returns a list of bullets but each bullet has been updated to move speed units in the direction specified by the field direction inside the bullet structure. 











