;; sequence(s): A64842
;; terms: 0 2 6 18 36 66 106 162 232 322 430 562 716 898 1106 1346 1616 1922 2262 2642
;; small program: (x mod 2) - loop(x - ((y * y) + y), x, x)
;; fast program: ((((1 + (2 + x)) * ((x * x) - 1)) div (2 + (2 + 2))) * 2) + 2
(set-logic UFNIA)
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (- x (+ (* y y) y)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (mod x 2) (v0 x)))))
(assert (forall ((x Int)) (= (fast x) (+ (* (div (* (+ 1 (+ 2 x)) (- (* x x) 1)) (+ 2 (+ 2 2))) 2) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
