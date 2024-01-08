class Person {
    private:
    int age;

    public:
    //Default ctor
    Person() {
        age = 99;
    }
    //1st non-default ctor
    Person(int a) {
        age = a;
    }
    //2nd non-default ctor
    Person(int a, int b) {
        age = a * b;
    }
};

int main() {

    Person p; // Default constructor should be called
    Person p1 = Person(10, 2); // 2nd non-default constructor should be called

    Person *p2 = new Person(10, 5);
    Person *p3 = new Person(30); // 1st non-default constructor

    return sizeof(p);
}