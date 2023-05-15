;; sequence(s): A316357
;; terms: 1 5 13 21 33 53 73 93 121 153 185 221 261 305 353 401 453 513 573 633
;; small program: (loop((((x + x) div (1 + 2)) + (x mod 2)) + x, 1, ((x * x) + x) div 2) * 2) + 1
;; fast program: (((((((1 + (2 + 2)) * ((x * x) + x)) div (2 + (2 + 2))) + 1) div 2) * 2) * 2) + 1
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ (div (+ x x) (+ 1 2)) (mod x 2)) x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (div (+ (* x x) x) 2))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (* (v0 x) 2) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (* (* (div (+ (div (* (+ 1 (+ 2 2)) (+ (* x x) x)) (+ 2 (+ 2 2))) 1) 2) 2) 2) 1))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
