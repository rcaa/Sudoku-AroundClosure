package guesser;

import driver.util.Util;

public aspect GuesserDynamic {

	Object around() : adviceexecution() && within(guesser.GuesserFeature){
		Object ret = null;
		if (driver.util.Driver.isActivated("guesser")) {
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