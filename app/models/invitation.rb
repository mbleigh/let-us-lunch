class Invitation
  include MongoMapper::EmbeddedDocument
  
  token :token, size: 40
  key :email, String, required: true
  key :response, String
end