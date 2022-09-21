public with sharing class HelloWorld {
    public String name;
    public String greeting;
    public HelloWorld() {
        this.greeting = 'Hello, Dreamforce!';
        this.name = 'Dreamforce';
    }

    public HelloWorld(String name) {
        this.greeting = 'Hello ' + name + '!';
        this.name = name;
    }
}
