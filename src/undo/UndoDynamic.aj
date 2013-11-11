package undo;

import driver.util.Util;

public aspect UndoDynamic {

	Object around() : adviceexecution() && within(undo.UndoFeature){
		Object ret = null;
		if (driver.util.Driver.isActivated("undo")) {
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