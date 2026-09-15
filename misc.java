@SuppressWarnings({ "unused", "unchecked", "serial", "rawtypes", "null", "deprecation" })

private void testRoute() throws URISyntaxException {
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append("file:");
		//		stringBuilder.append("/C:");
		stringBuilder.append("/var/spool/splitter/PopGenPatientList/PopGenDB/");
		UriBuilder builder = UriBuilder.fromUri(stringBuilder.toString());
		builder.replaceQueryParam("noop", "true");
		String fileName = "2016-12-20T14.36.59";
		String extL = ".idat.log.tsv";
		String uriL = builder.replaceQueryParam("fileName", fileName + extL).build().toString();
		String extJ = ".trf.mrg.log2.tsv";
		String uriJ = builder.replaceQueryParam("fileName", fileName + extJ).build().toString();
		String extR = ".mrg.log.tsv";
		String subDir = "inProgress/done/";
		String uriR = builder.path(subDir).replaceQueryParam("fileName", fileName + extR).build().toString();
		AggregationStrategy aggregationStrategy;
		aggregationStrategy = new MyJoinAggStrat();
		//		aggregationStrategy = new UseLatestAggregationStrategy();
		CsvDataFormat csvDataFormat = new CsvDataFormat(CSVFormat.MYSQL);
		RouteDefinition routeDefinition = from(uriL)//
				.log(LoggingLevel.INFO, logger, "Processing the file ${file:name}") //
				.unmarshal().csv()//
				.pollEnrich(uriR, aggregationStrategy)
				//				.aggregate(header("id"))
				//.unmarshal().csv()//
				.marshal(csvDataFormat)//
				//.csv()
				.to(uriJ)//
				.log(LoggingLevel.INFO, logger, "Processing done for file ${file:name}")
				//
				;
		
		String currentMethodName = new java.lang.Exception().getStackTrace()[0].getMethodName();

	}