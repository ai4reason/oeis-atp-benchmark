;; sequence(s): A270700
;; terms: 12 42 78 114 150 186 222 258 294 330 366 402 438 474 510 546 582 618 654 690
;; small program: loop(1 + (if x <= 0 then 1 else (2 * ((x + x) + x))), 2, x) - 1
;; fast program: 2 * ((1 + 2) * (1 + (if x <= 0 then 1 else (2 * ((x + x) + x)))))
(set-logic UFNIA)
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (ite (<= x 0) 1 (* 2 (+ (+ x x) x)))))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (- (v0 x) 1))))
(assert (forall ((x Int)) (= (fast x) (* 2 (* (+ 1 2) (+ 1 (ite (<= x 0) 1 (* 2 (+ (+ x x) x)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
