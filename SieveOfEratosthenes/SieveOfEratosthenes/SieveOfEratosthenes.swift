import Foundation

class SieveOfEratosthenes {
    
    private func sieve(_ upperBound: Int) -> [Int] {

        var result: [Int] = []
        let upperBoundSquareRoot = Int(sqrt(Double(upperBound)))
        var isComposite: [Bool] = Array(repeating: false, count: upperBound + 1)
        
        for m in 2...upperBoundSquareRoot {
            if !isComposite[m] {
                result.append(m)
                var k = m * m
                while k <= upperBound {
                    isComposite[k] = true
                    k += m
                }
            }
        }
        for m in upperBoundSquareRoot...upperBound {
            if (!isComposite[m]) {
                result.append(m)
            }
            
        }
        
        return result
    }
    
    internal func primeNumbers(upTo num: Int) -> [Int] {
        if num == 0 {
            return []
        }
        
        return [1] + sieve(num)
    }
    
}

