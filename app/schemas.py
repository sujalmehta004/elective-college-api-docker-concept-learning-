from pydantic import BaseModel, EmailStr

# For login
class LoginRequest(BaseModel):
    username: str
    password: str

# For token response
class TokenResponse(BaseModel):
    access_token: str
    token_type: str = "bearer"

# For student create/update requests
class StudentCreate(BaseModel):
    name: str
    email: EmailStr

# For student response
class Student(StudentCreate):
    id: int

    class Config:
        orm_mode = True
