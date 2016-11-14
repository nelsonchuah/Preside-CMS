/**
 * Handler for website user interactions
 *
 */
component {
	property name="websiteUserDao" inject="presidecms:object:website_user";

	private struct function prepareParameters( event, rc, prc, args={} ) {
		var user = websiteUserDao.selectData( id=args.userId ?: "" );

		for( var u in user ) {
			return u;
		}

		u = {};
		for( var col in ListToArray( user.columnList ) ) {
			u[ col ] = "";
		}
		return u;
	}

	private struct function getPreviewParameters( event, rc, prc, args={} ) {
		return {
			  display_name  = "Sam Montoya"
			, login_id      = "sam"
			, email_address = "sam.montoya@test.com"
		};
	}

	private string function getToAddress( event, rc, prc, args={} ) {
		var user = websiteUserDao.selectData( id=args.userId ?: "" );

		return user.email_address ?: "";
	}
}