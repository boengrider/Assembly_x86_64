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
    Person p;
}