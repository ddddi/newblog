import org.junit.jupiter.api.Test;

/**
 * @Author liudi
 * @Date Create in 17:55 2018/12/17
 */
public class DataStructureTest {

    @Test
    public  void testMain(){
        int n = 19;
        double[] a = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
        double x = 10.0;
        long start1 = System.currentTimeMillis();
        double test1 = test1(n,a,x);
        long end1 = System.currentTimeMillis();
        long start2 = System.currentTimeMillis();
        double test2 = test2(n,a,x);
        long end2 = System.currentTimeMillis();
        System.out.println("方法一运行时间: "+(test1 - start1)+"ms");
        System.out.println("方法二运行时间: "+(test2 - start2)+"ms");
    }


    /**
     *  写一个多项式的算法,给定点x这个地方 多项式的值
     *  f(x)
     */
    public double test1(int n, double[] a, double x){
        double  p= a[0];
        for(int i = 1 ; i < n ;i ++){
            p +=  a[i]*Math.pow(x,i);
        }
        return p ;
    }

    public double test2(int n, double[] a, double x){
        double  p= a[n];
        for(int i = n ; i >0;i --){
            p = p*x + a[i-1];
        }
        return p ;
    }



}
