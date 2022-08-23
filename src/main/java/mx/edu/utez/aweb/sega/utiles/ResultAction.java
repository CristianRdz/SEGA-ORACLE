package mx.edu.utez.aweb.sega.utiles;

public class ResultAction<T> {
    T obj;
    private String message;
    private int status;
    private boolean result;

    public ResultAction(T obj) {
        this.obj = obj;
    }

    public ResultAction() {
    }

    public T getObj() {
        return obj;
    }

    public void setObj(T obj) {
        this.obj = obj;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public boolean isResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }

    public ResultAction(T obj, String message, int status, boolean result) {
        this.obj = obj;
        this.message = message;
        this.status = status;
        this.result = result;
    }
}

