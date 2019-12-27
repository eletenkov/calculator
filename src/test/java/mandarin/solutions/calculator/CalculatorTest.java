package mandarin.solutions.calculator;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertEquals;

@SpringBootTest
public class CalculatorTest {

    @Autowired
    Calculator calculator;

    @DisplayName("Test Claculator Service")
    @Test
    void testSum() {
        assertEquals(5, calculator.sum(2, 3));
    }
}