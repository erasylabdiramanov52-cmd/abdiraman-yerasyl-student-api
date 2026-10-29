package kz.iitu.abdiraman.studentapi;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;

class IntentionalFailureTest {
    @Test
    void demonstratePipelineFailure() {
        assertTrue(true, "Intentional Jenkins failure demonstration");
    }
}
