class Contact

  attr_reader   :id
  attr_accessor :last_name, :first_name, :email, :note

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
   @first_name   = first_name
   @last_name    = last_name
   @email        = email
   @note         = note
   @id = @@id

   @@id += 1

  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note = 'N/A')
    new_contact = Contact.new(first_name, last_name, email, note = 'N/A')
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
      return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, updated_value)
    case attribute
      when "first_name"
        self.first_name = updated_value
      when "last_name"
        self.last_name = updated_value
      when "email"
        self.email = updated_value
      when "note"
        self.note = updated_value
      else
        puts "That isn't a valid field. Please enter first name, last name, email or note."
      end
    end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty

  def self.find_by(attribute, value)
    case attribute
      when "first_name"
        @@contacts.each do |current_contact|
          if current_contact.first_name == value
            return current_contact
          end
        end

      when "last_name"
        @@contacts.each do |current_contact|
          if current_contact.last_name == value
            return current_contact
          end
        end

      when "email"
        @@contacts.each do |current_contact|
          if current_contact.email == value
            return current_contact
          end
        end

      else
        puts "That isn't a valid field. Please enter first name, last name, email."
      end
    end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
     "#{ @first_name } #{ @last_name }"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end

# john = Contact.create("John", "Smith", "john@gmail.com")
# kim = Contact.create("Kim", "Wright", "kim@gmail.com")
# peg = Contact.create("Peggy", "Bell", "peggy@gmail.com")
# tim = Contact.create("Tim", "Richards", "tim_richards@gmail.com")
