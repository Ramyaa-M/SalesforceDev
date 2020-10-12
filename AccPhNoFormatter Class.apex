public class AccPhNoFormatter {
	public static void accFormatPhoneNumber(List<Account> allAccountInsert){        
	    List<SObject> recordsToUpdate = new List<SObject>();
        String countryCode 	= '+61';
    	String phone 		= null;
        for (Account newAccount: allAccountInsert){            
            phone 		= 	newAccount.Phone;
            system.debug('Before IF statement Phone'+phone);
        	//Following if statement take care of the formatting of Phone field.
            if(phone != null){
                if((!string.ValueOf(phone).startsWith('61') || !string.ValueOf(phone).startsWith('+61')) && (phone.length() == 10 || phone.length() == 9)){   
                    if(phone.length() == 10){
                        phone = countryCode + ' ' + phone.substring(1, 2) + ' ' + phone.substring(2, 6) + ' ' + phone.substring(6, 10);
                        System.debug('Working here in HomePhone 10 digits insert');
                    } else if(phone.length() == 9){                	
                        phone = countryCode + ' ' + phone.substring(0, 1) + ' ' + phone.substring(1, 5) + ' ' + phone.substring(5, 9);
                    }                
                    system.debug('After IF statement Phone'+phone);
                    newAccount.Phone	=	phone;       
                }
            }                        	          
            recordsToUpdate.add(newAccount);            
        }
        update recordsToUpdate;
    }

}