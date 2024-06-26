/// A string datatype definition which extends <class>%Library.String</class> with additional regex pattern validation. <br>
/// It does not support data population using the regex yet
Class MasterLib.DataTypes.StringRgx Extends %Library.String [ ClientDataType = VARCHAR, OdbcType = VARCHAR, SqlCategory = STRING ]
{

/// Set PATTERN to empty and final as it is not relevant on
/// this type, but is inherited from <class>%Library.String</class>
Parameter PATTERN [ Final ];

/// Set VALUELIST to empty and final as it is not relevant on
/// this type, but is inherited from <class>%Library.String</class>
Parameter VALUELIST [ Final ];

/// Set DISPLAYLIST to empty and final as it is not relevant on
/// this type, but is inherited from <class>%Library.String</class>
Parameter DISPLAYLIST [ Final ];

/// Set a valid regex pattern for value validation
Parameter REGEX As %String;

/// Tests if the logical value <var>%val</var>, which is a string, is valid.
/// The validation is based on the class parameter settings used for the class attribute this data type is associated with.
/// In this case, <a href="#MINLEN">MINLEN</a>, <a href="#MAXLEN">MAXLEN</a>, and <a href="#REGEX">REGEX</a>.
ClassMethod IsValid(%val As %CacheString) As %Status [ ServerOnly = 0 ]
{
	// Length checks
	if (..#MAXLEN '= "") {
		if ($length(%val) > ..#MAXLEN) {
			return $$$ERROR($$$DTMaxLen, %val, ..#MAXLEN)
		}
	}
	if (..#MINLEN '= "") {
		if ($length(%val) < ..#MINLEN) {
			return $$$ERROR($$$DTMinLen, %val, ..#MINLEN)
		}
	}
	// Regex check
	if (..#REGEX '= "") {
		try {
			if '$MATCH(%val, ..#REGEX) {
				return $$$ERROR($$$DTPattern, %val, ..#REGEX)
			}
		} catch Ex {
			return $$$ERROR($$$URegexRuleSyntax)
		}
	}
	return $$$OK
}

}
