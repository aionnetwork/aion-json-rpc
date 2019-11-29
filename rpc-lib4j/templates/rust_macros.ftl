<#function toJavaType type>
    <#local typeName = type.name>
    <#if type.baseType?has_content>
        <#return toJavaType(type.baseType)>
    <#elseif typeName=="uint16">
        <#return "u32">
    <#elseif typeName=="uint32">
        <#return "u64">
    <#elseif typeName=="uint64">
        <#return "u64">
    <#elseif typeName=="uint128">
        <#return "U126">
    <#elseif typeName=="uint256">
        <#return "U256">
    <#elseif typeName == "string">
        <#return "String">
    <#elseif typeName == "error">
        <#return "RPCError">
    <#elseif type.nestedType?has_content>
        <#return "Vec<${toJavaType(type.nestedType)}>">
    <#elseif typeName == "byte">
        <#return "u8">
    <#elseif typeName == "bool">
        <#return "bool">
    <#elseif typeName == "byte-array">
        <#return "Vec<u8>">
    <#elseif typeName == "blockSpecifier">
        <#return "BlockSpecifier">
    <#elseif typeName == "blockDetails">
        <#return "BlockDetails">
    <#elseif typeName == "blockEnum">
        <#return "BlockEnum">
    <#elseif typeName=="blockSpecifierUnion">
        <#return "BlockSpecifierUnion">
    <#elseif typeName=="resultUnion">
        <#return "ResultUnion">
    <#elseif typeName=="paramUnion">
        <#return "ParamUnion">
    <#elseif typeName == "txDetails">
        <#return "TransactionDetails">
    <#elseif typeName == "address" >
        <#return "AionAddress">
    <#elseif typeName="request">
        <#return "Request">
    <#elseif typeName=="blockTemplate">
        <#return "BlockTemplate">
    <#elseif typeName=="submissionResult">
        <#return "SubmissionResult">
    <#elseif typeName=="validateAddressResult">
        <#return "ValidateAddressResult">
    <#elseif typeName=="minerStats">
        <#return "MinerStats">
    <#elseif typeName=="submitBlockParams">
        <#return "SubmitBlockParams">
    <#elseif typeName=="addressParams">
        <#return "AddressParams">
    <#elseif typeName=="ecRecoverParams">
        <#return "EcRecoverParams">
    <#elseif typeName=="voidParams">
        <#return "VoidParams">
    <#elseif typeName=="version_string">
        <#return "VersionType">
    <#elseif typeName=="long">
        <#return "u64">
    <#elseif typeName=="int">
        <#return "u32">
    <#elseif typeName=="bigint">
        <#return "U256">
    <#elseif typeName=="response">
        <#return "Response">
    <#elseif typeName=="txLogDetails">
        <#return "TxLogDetails">
    <#elseif typeName=="submitSignatureParams">
        <#return "SubmitSignatureParams">
    <#elseif typeName=="submitSeedParams">
        <#return "SubmitSeedParams">
    <#elseif typeName=="addressParams">
        <#return "AddressParams">
    <#elseif typeName=="validateAddressResults">
        <#return "ValidateAddressResults">
    <#else >
        <#return typeName>
    </#if>
</#function>

<#function toJavaClassName className>
    <#if className=="personal">
        <#return "Personal"/>
    <#elseif className=="ops">
        <#return "Ops">
    <#elseif className=="stratum">
        <#return "Stratum">
    </#if>
</#function>

<#function toJavaException exceptionName>
    <#return "${exceptionName}RPCException">
</#function>

<#function toJavaConverter converterType>
    <#if converterType.nestedType?has_content>
        <#return "${toCamelCase(converterType.nestedType.name)}ListConverter">
    <#else >
        <#return "${toCamelCase(converterType.name)}Converter">
    </#if>
</#function>

<#function toJavaConverterFromName name>
    <#return "${toCamelCase(name)}Converter">
</#function>

<#function toCamelCase typeName>

    <#if typeName == "string">
        <#return "String">
    <#elseif typeName == "data_hex_string">
        <#return "DataHexString">
    <#elseif typeName == "hex_string">
        <#return "HexString">
    <#elseif typeName == "byte">
        <#return "Byte">
    <#elseif typeName=="uint16">
        <#return "U16">
    <#elseif typeName=="uint32">
        <#return "U32">
    <#elseif typeName=="uint64">
        <#return "U64">
    <#elseif typeName=="uint128">
        <#return "U128">
    <#elseif typeName=="uint256">
        <#return "U256">
    <#elseif typeName == "bool">
        <#return "Bool">
    <#elseif typeName == "byte-array">
        <#return "VecU8">
    <#elseif typeName == "blockSpecifier">
        <#return "BlockSpecifier">
    <#elseif typeName == "blockDetails">
        <#return "BlockDetails">
    <#elseif typeName == "blockEnum">
        <#return "BlockEnum">
    <#elseif typeName=="blockSpecifierUnion">
        <#return "BlockSpecifierUnion">
    <#elseif typeName=="resultUnion">
        <#return "ResultUnion">
    <#elseif typeName=="paramUnion">
        <#return "ParamUnion">
    <#elseif typeName == "txDetails">
        <#return "TransactionDetails">
    <#elseif typeName == "big_int_hex_string">
        <#return "BigIntegerHexString">
    <#elseif typeName == "long_hex_string">
        <#return "LongHexString">
    <#elseif typeName == "int_hex_string">
        <#return "IntHexString">
    <#elseif typeName == "uint256_hex_string">
        <#return "Uint256IntHexString">
    <#elseif typeName=="decimal_string">
        <#return "DecimalString">
    <#elseif typeName=="blockTemplate">
        <#return "BlockTemplate">
    <#elseif typeName=="submissionResult">
        <#return "SubmissionResult">
    <#elseif typeName=="validateAddressResult">
        <#return "ValidateAddressResult">
    <#elseif typeName=="minerStats">
        <#return "MinerStats">
    <#elseif typeName=="submitBlockParams">
        <#return "SubmitBlockParams">
    <#elseif typeName=="addressParams">
        <#return "AddressParams">
    <#elseif typeName == "address" >
        <#return "AionAddress">
    <#elseif typeName="request">
        <#return "Request">
    <#elseif typeName=="ecRecoverParams">
        <#return "EcRecoverParams">
    <#elseif typeName=="voidParams">
        <#return "VoidParams">
    <#elseif typeName=="version_string">
        <#return "VersionType">
    <#elseif typeName=="long">
        <#return "I64">
    <#elseif typeName=="int">
        <#return "I32">
    <#elseif typeName=="bigint">
        <#return "U256">
    <#elseif typeName=="response">
        <#return "Response">
    <#elseif typeName=="error">
        <#return "RPCError">
    <#elseif typeName=="any">
        <#return "Object">
    <#elseif typeName=="txLogDetails">
        <#return "TxLogDetails">
    <#elseif typeName=="byte_hex_string">
        <#return "ByteHexString">
    <#elseif typeName=="byte_32_string">
        <#return "Byte32String">
    <#elseif typeName=="byte_64_string">
        <#return "Byte64String">
    <#elseif typeName=="submitSignatureParams">
        <#return "SubmitSignatureParams">
    <#elseif typeName=="submitSeedParams">
        <#return "SubmitSeedParams">
    <#elseif typeName=="addressParams">
        <#return "AddressParams">
    <#elseif typeName=="validateAddressResults">
        <#return "ValidateAddressResults">
    <#else >
        <#return typeName>
    </#if>
</#function>

<#function resultExtractorFromName type>
    <#if type.baseType?has_content><#return resultExtractorFromName(type.baseType)></#if>
    <#local name = type.name>
    <#if name=="byte-array">
        <#return "r->r.byteArray">
    <#elseif name=="bigint">
        <#return "r->r.bigInt">
    <#else>
        <#return "r->r.${name}">
    </#if>
</#function>

<#function paramsExtractorFromName name>
    <#return name>
</#function>
