#pragma once
#include <string>
#include <memory>

// TODO: In the course project, you need to properly organize the files.
// Type.h
class Type {
public:
    enum TypeID {
        IntTypeID,
        VoidTypeID,
        ArrayTypeID,
        FunctionTypeID,
        PointerTypeID
    };
    
    Type(TypeID id) : typeID(id) {}
    virtual ~Type() = default;
    
    TypeID getTypeID() const { return typeID; }
    virtual std::string toString() const = 0;
    virtual bool isConst() const { return false; }
    
private:
    TypeID typeID;
};