public class PhNumberFormatterInsert {
    public static void formatPhoneNumber(List<Contact> allContactInsert){        
        List<SObject> recordsToUpdate = new List<SObject>();
        String countryCode  = '+61';
        String phone        = null;
        String mobilePhone  = null;
        String homePhone    = null;
        for (Contact newContact: allContactInsert){            
            phone       =   newContact.Phone;
            mobilePhone =   newContact.MobilePhone;
            homePhone   =   newContact.HomePhone;
            //Following if statement take care of the formatting of Phone field.
            if(phone != null){
                if((!string.ValueOf(phone).startsWith('61') || !string.ValueOf(phone).startsWith('+61')) && (phone.length() == 10 || phone.length() == 9)){   
                    if(phone.length() == 10){
                        phone = countryCode + ' ' + phone.substring(0, 4) + ' ' + phone.substring(4, 7) + ' ' + phone.substring(7, 10);
                    } else if(phone.length() == 9){
                        phone = '0' + phone;
                        phone = countryCode + ' ' + phone.substring(0, 4) + ' ' + phone.substring(4, 7) + ' ' + phone.substring(7, 10);
                    }                
                    system.debug('Phone'+phone);
                    newContact.Phone    =   phone;       
                }
            }
                
            //Following if statement take care of the formatting of MobilePhone field.           
            if(mobilePhone != null){
                if((!string.ValueOf(mobilePhone).startsWith('61') || !string.ValueOf(mobilePhone).startsWith('+61')) && (mobilePhone.length() == 10 || mobilePhone.length() == 9) && mobilePhone.length() != 0){   
                    if(mobilePhone.length() == 10){
                        mobilePhone = countryCode + ' ' + mobilePhone.substring(0, 4) + ' ' + mobilePhone.substring(4, 7) + ' ' + mobilePhone.substring(7, 10);
                    } else if(mobilePhone.length() == 9){
                        mobilePhone = '0' + mobilePhone;
                        mobilePhone = countryCode + ' ' + mobilePhone.substring(0, 4) + ' ' + mobilePhone.substring(4, 7) + ' ' + mobilePhone.substring(7, 10);
                    }                
                    system.debug('Mobile Phone'+mobilePhone);
                    newContact.MobilePhone  =   mobilePhone;       
                }
            }
            //Following part formats the Landline number "Home Phone"
            if(homePhone != null){
                if((!string.ValueOf(homePhone).startsWith('61') || !string.ValueOf(homePhone).startsWith('+61')) && (homePhone.length() == 10 || homePhone.length() == 9) && homePhone.length() != 0){   
                    if(homePhone.length() == 10){
                        homePhone = countryCode + ' ' + homePhone.substring(1, 2) + ' ' + homePhone.substring(2, 6) + ' ' + homePhone.substring(6, 10);
                        System.debug('Working here in HomePhone 10 digits insert');
                    } else if(homePhone.length() == 9){                 
                        homePhone = countryCode + ' ' + homePhone.substring(0, 1) + ' ' + homePhone.substring(1, 5) + ' ' + homePhone.substring(5, 9);
                    }                
                    system.debug('Home Phone'+homePhone);
                    newContact.HomePhone    =   homePhone;       
                }
            }            
            recordsToUpdate.add(newContact);            
        }
        update recordsToUpdate;
    }

}