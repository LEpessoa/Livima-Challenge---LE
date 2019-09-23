class Employee < ApplicationRecord
    validates :nome, presence: true,
                    length: { minimum: 5 }
    validates :email, presence: true,
                    length: { minimum: 5 }
    validates :cargo, presence: true,
                    length: { minimum: 5 }
    validates :salário, presence: true,
                    length: { minimum: 5 }
end
