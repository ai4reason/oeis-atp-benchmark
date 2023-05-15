;; sequence(s): A63153
;; terms: 7 26 42 62 78 98 114 134 150 170 186 206 222 242 258 278 294 314 330 350
;; small program: (((x mod 2) + loop(1 + ((x + x) + x), 2, x)) * 2) - (if x <= 0 then 1 else 2)
;; fast program: (2 * (((2 * ((2 * (x + x)) + 2)) + (x mod 2)) + x)) - (if x <= 0 then 1 else 2)
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ (+ x x) x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (* (+ (mod x 2) (v0 x)) 2) (ite (<= x 0) 1 2)))))
(assert (forall ((x Int)) (= (fast x) (- (* 2 (+ (+ (* 2 (+ (* 2 (+ x x)) 2)) (mod x 2)) x)) (ite (<= x 0) 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
