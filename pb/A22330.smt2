;; sequence(s): A22330
;; terms: 1 3 7 12 19 27 37 49 62 77 93 111 131 152 175 199 225 252 281 312
;; small program: loop(((((((y div 2) + y) div 2) + y) div (1 + 2)) + x) + y, x, 1) + x
;; fast program: (((((((1 + (2 + (2 * (2 * (2 + 2))))) * (x * x)) div (2 * (2 + 2))) + 1) + x) div (1 + 2)) + 1) + x
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (div (+ (div (+ (div y 2) y) 2) y) (+ 1 2)) x) y))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) x))))
(assert (forall ((x Int)) (= (fast x) (+ (+ (div (+ (+ (div (* (+ 1 (+ 2 (* 2 (* 2 (+ 2 2))))) (* x x)) (* 2 (+ 2 2))) 1) x) (+ 1 2)) 1) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
