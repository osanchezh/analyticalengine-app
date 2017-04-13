package org.evaluation.web.util;

import java.util.Random;

public final class MathUtil {
	public static double getRandom(Double valorMinimo, Double valorMaximo) {
        Random rand = new Random();
        return  valorMinimo + ( valorMaximo - valorMinimo ) * rand.nextDouble();
    }
}
