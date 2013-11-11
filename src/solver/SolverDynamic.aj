package solver;

import driver.util.Util;

public aspect SolverDynamic {

	Object around() : adviceexecution() && within(solver.SolverFeature){
		Object ret = null;
		if (driver.util.Driver.isActivated("solver")) {
			ret = proceed();
		} else {
			try {
				ret = Util.proceedAroundCall(thisJoinPoint);
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
		return ret;
	}
}