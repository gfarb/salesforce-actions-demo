@isTest
public with sharing class HelloWorldTest {
    static @IsTest
    void positive() {
        Test.startTest();
        HelloWorld helloWorldTest = new HelloWorld('Dreamforce 2022');
        Test.stopTest();
        System.assertEquals('Dreamforce 2022', helloWorldTest.name);
    }

    static @IsTest
    void negative() {
        Test.startTest();
        HelloWorld helloWorldTest = new HelloWorld();
        Test.stopTest();
        System.assertEquals('Dreamforce', helloWorldTest.name);
    }
}
