@isTest
public class CalculatorDemoTest {
	@isTest
    static void testSum(){
        CalculatorDemo demo = new CalculatorDemo();
        demo.sum(10,20);
        System.assertEquals(30, demo.result);
        }
    @isTest
     static void testmul(){
        CalculatorDemo demo = new CalculatorDemo();
        demo.multiply(10,20);
        System.assertEquals(200, demo.result);
     }
    
}