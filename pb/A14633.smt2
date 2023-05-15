;; sequence(s): A14633
;; terms: 0 12 22 70 92 176 210 330 376 532 590 782 852 1080 1162 1426 1520 1820 1926 2262
;; small program: (((1 + 2) * (((x mod 2) + x) * x)) - (x div 2)) * 2
;; fast program: (((1 + (2 * ((x + x) + x))) * ((x mod 2) + x)) - x) - x
(set-logic UFNIA)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (- (* (+ 1 2) (* (+ (mod x 2) x) x)) (div x 2)) 2))))
(assert (forall ((x Int)) (= (fast x) (- (- (* (+ 1 (* 2 (+ (+ x x) x))) (+ (mod x 2) x)) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
