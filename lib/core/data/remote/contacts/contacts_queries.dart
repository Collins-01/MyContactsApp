class ContactsQueries {
  static String createContactMutation = '''
      mutation Contact (\$id: ID!, \$name: String!, \$phone: String!, \$email: String!, \$address: String, \$discarded: Boolean)  {
    contact(
        contactInput: {\$id: ID!, \$name: String!, \$phone: String!, \$email: String!, \$address: String, \$discarded: Boolean}
    ) {
        status
        contact {
            address
            createdAt
            email
            id
            name
            phone
            updatedAt
        }
        errors {
            fullMessage
            message
            property
        }
    }
}


       ''';

  static String fetchAllContactsQuery = '''
     query Contacts {
    contacts {
        address
        createdAt
        email
        id
        name
        phone
        updatedAt
    }
}


 ''';

  static String fetchSingleContact = ''' 
    query Contacts (\$id: ID!) {
    contacts(id: \$id) {
        address
        createdAt
        email
        id
        name
        phone
        updatedAt
    }
}

  
  
  ''';
}
