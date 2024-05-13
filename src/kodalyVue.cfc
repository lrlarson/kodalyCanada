<cfcomponent>
    <cfheader name="Access-Control-Allow-Origin" value="*">
	<cfheader name="Access-Control-Allow-Methods" value="OPTIONS,GET,PUT,POST,DELETE">
    <cfheader name="Access-Control-Allow-Headers" value="Origin, X-Requested-With, Content-Type, Accept">
    <cffunction name="init" access="remote" returntype="any">
        <cfreturn this/>
    </cffunction> 

    <cffunction name="checkForTrue" access="public" returntype="any" >
        <cfargument name="test" type="any" >
            <cfif test EQ true || test EQ 1>
                <cfset test = 1>
            <cfelse>
                <cfset test = 0>    
            </cfif>
            <cfreturn test>
    </cffunction>       

    <cffunction name="insertSong" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="SongDetails" type="any">
        <cfset SongDetails = DeserializeJSON(SongDetails)>
        <cfif #SongDetails.ANALYZED# eq "true" || #SongDetails.ANALYZED# eq 1>
            <cfset SongDetails.ANALYZED = 1>
            <cfelse>
            <cfset #SongDetails.ANALYZED#= 0>
            </cfif>
            <cfif #SongDetails.INFINALE# eq "true" || #SongDetails.INFINALE# eq 1>
            <cfset #SongDetails.INFINALE# = 1>
            <cfelse>
            <cfset #SongDetails.INFINALE#  = 0>
            </cfif>
            <cfif #SongDetails.PROOFED_FLAG# eq "true" || SongDetails.PROOFED_FLAG eq 1>
            <cfset SongDetails.PROOFED_FLAG = 1>
            <cfelse>
            <cfset SongDetails.PROOFED_FLAG = 0>
            </cfif>
            <cfif #SongDetails.IP_STATUS# eq "true" || #SongDetails.IP_STATUS# eq 1>
            <cfset SongDetails.IP_STATUS = 1>
            <cfelse>
            <cfset SongDetails.IP_STATUS = 0>
            </cfif>
            <cfif #SongDetails.LOC# eq "true" || #SongDetails.LOC#  eq 1>
            <cfset SongDetails.LOC = 1>
            <cfelse>
            <cfset SongDetails.LOC = 0>
            </cfif>
            <cfif #SongDetails.CHILD# eq "true" || #SongDetails.CHILD# eq 1>
            <cfset SongDetails.CHILD = 1>
            <cfelse>
            <cfset SongDetails.CHILD = 0>
            </cfif>
    
                    
                <cfif #SongDetails.RECORDING_FLAG# eq 'true' || #SongDetails.RECORDING_FLAG#  eq 1>
                <cfset SongDetails.RECORDING_FLAG = 1>    
                <cfelse>  
                 <cfset SongDetails.RECORDING_FLAG = 0>    
                </cfif> 
                
                <cfif #SongDetails.GAME# eq 'true' || #SongDetails.GAME#  eq 1>
                <cfset SongDetails.GAME = 1>    
                <cfelse>  
                 <cfset SongDetails.GAME = 0>    
                </cfif> 

                <cfif #SongDetails.PUBLISH# eq 'true' || #SongDetails.PUBLISH#  eq 1>
                    <cfset SongDetails.PUBLISH = 1>    
                    <cfelse>  
                     <cfset SongDetails.PUBLISH = 0>    
                    </cfif> 
        <cfquery name="edit" datasource="kodaly_4" >
                insert into tbl_Titles
                (
                    Title,
                    Alt_Title_1,
                    Alt_Title_2,
                    First_Line_Text,
                    Informant,
                    Song_Background,
                    Recording_Flag,
                    Game,
                    stateID,
                    regionID,
                    ethnicityID,
                    Publication,
                    Comments,
                    Publish,
                    IP_Status,
                    Child,
                    LOC,
                    Notation_File_Name,
                    inFinale
                )values(
                    '#SongDetails.TITLE#',
                    '#SongDetails.ALT_TITLE_1#',
                    '#SongDetails.ALT_TITLE_2#'  ,
                    '#SongDetails.FIRST_LINE_TEXT#' ,
                    '#SongDetails.INFORMANT#',
                    '#SongDetails.SONG_BACKGROUND#',
                    #SongDetails.RECORDING_FLAG#,
                    #SongDetails.GAME#,
                    #SongDetails.STATEID# ,
                    #SongDetails.REGIONID# ,
                    #SongDetails.ETHNICITYID# ,
                    '#SongDetails.PUBLICATION#',
                    '#SongDetails.COMMENTS#',
                    #SongDetails.PUBLISH#,
                    #SongDetails.IP_STATUS#,
                    #SongDetails.CHILD#,
                    #SongDetails.LOC#,
                    '#SongDetails.NOTATION_FILE_NAME#', 
                    #SongDetails.INFINALE#
                )
                select @@IDENTITY
             
        </cfquery>
        <cfset arrGirls = QueryToStruct(edit)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>  
     </cffunction>   


    <cffunction name="saveRythmicEdits" access="remote" returntype="any" returnformat="JSON" >
        <cfargument name="songDetails" required="true" type="ANY" > 
        <cfset songDetails = DeserializeJSON(songDetails)> 
        <cfif #SongDetails.TA# eq "true" || #SongDetails.TA# eq 1>
            <cfset SongDetails.TA= 1>
            <cfelse>
            <cfset SongDetails.TA = 0>
            </cfif>
            
            <cfif #SongDetails.TI_TI# eq "true" || #SongDetails.TI_TI#  eq 1>
            <cfset SongDetails.TI_TI= 1>
            <cfelse>
            <cfset SongDetails.TI_TI = 0>
            </cfif>
            
            <cfif #SongDetails.REST# eq "true" || #SongDetails.REST#  eq 1>
            <cfset SongDetails.REST= 1>
            <cfelse>
            <cfset SongDetails.REST = 0>
            </cfif>
            
            <cfif #SongDetails.TA_A# eq "true" || #SongDetails.TA_A# eq 1>
            <cfset SongDetails.TA_A= 1>
            <cfelse>
            <cfset SongDetails.TA_A = 0>
            </cfif>
            
            <cfif #SongDetails.HALF_REST# eq "true" || #SongDetails.HALF_REST# eq 1>
            <cfset SongDetails.HALF_REST= 1>
            <cfelse>
            <cfset SongDetails.HALF_REST = 0>
            </cfif>
            
            <cfif #SongDetails.TA_A_A# eq "true" || #SongDetails.TA_A_A#  eq 1>
            <cfset SongDetails.TA_A_A= 1>
            <cfelse>
            <cfset SongDetails.TA_A_A = 0>
            </cfif>
            
            <cfif #SongDetails.TA_A_A_A# eq "true" || #SongDetails.TA_A_A_A#  eq 1>
            <cfset SongDetails.TA_A_A_A= 1>
            <cfelse>
            <cfset SongDetails.TA_A_A_A = 0>
            </cfif>
            
            <cfif #SongDetails.WHOLE_REST# eq "true" || #SongDetails.WHOLE_REST# eq 1>
            <cfset SongDetails.WHOLE_REST= 1>
            <cfelse>
            <cfset SongDetails.WHOLE_REST = 0>
            </cfif>
            
            <cfif #SongDetails.TIRI_TIRI# eq "true" || #SongDetails.TIRI_TIRI# eq 1>
            <cfset SongDetails.TIRI_TIRI= 1>
            <cfelse>
            <cfset SongDetails.TIRI_TIRI = 0>
            </cfif>
            
            <cfif #SongDetails.TI_TIRI# eq "true" || #SongDetails.TI_TIRI#  eq 1>
            <cfset SongDetails.TI_TIRI= 1>
            <cfelse>
            <cfset SongDetails.TI_TIRI = 0>
            </cfif>
            
            <cfif #SongDetails.TIRI_TI# eq "true" || #SongDetails.TIRI_TI#  eq 1>
            <cfset SongDetails.TIRI_TI= 1>
            <cfelse>
            <cfset SongDetails.TIRI_TI = 0>
            </cfif>
            
            <cfif #SongDetails.TI_TA_TI# eq "true" || #SongDetails.TI_TA_TI#  eq 1>
            <cfset SongDetails.TI_TA_TI= 1>
            <cfelse>
            <cfset SongDetails.TI_TA_TI = 0>
            </cfif>
            
            <cfif #SongDetails.TAI_TI# eq "true" || #SongDetails.TAI_TI#  eq 1>
            <cfset SongDetails.TAI_TI= 1>
            <cfelse>
            <cfset SongDetails.TAI_TI = 0>
            </cfif>
            
            <cfif #SongDetails.TI_TAI# eq "true" || #SongDetails.TI_TAI# eq 1>
            <cfset SongDetails.TI_TAI= 1>
            <cfelse>
            <cfset SongDetails.TI_TAI = 0>
            </cfif>
            
            <cfif #SongDetails.EIGHTH_REST# eq "true" || #SongDetails.EIGHTH_REST# eq 1>
            <cfset SongDetails.EIGHTH_REST= 1>
            <cfelse>
            <cfset SongDetails.EIGHTH_REST = 0>
            </cfif>
            
            <cfif #SongDetails.TI# eq "true" || #SongDetails.TI#  eq 1>
            <cfset SongDetails.TI= 1>
            <cfelse>
            <cfset SongDetails.TI = 0>
            </cfif>
            
            <cfif #SongDetails.TIRI# eq "true" || #SongDetails.TIRI# eq 1>
            <cfset SongDetails.TIRI= 1>
            <cfelse>
            <cfset SongDetails.tiri = 0>
            </cfif>
            
            <cfif #SongDetails.TIM_RI# eq "true" || #SongDetails.TIM_RI# eq 1>
            <cfset SongDetails.TIM_RI= 1>
            <cfelse>
            <cfset SongDetails.TIM_RI = 0>
            </cfif>
            
            <cfif #SongDetails.RI_TIM# eq "true" || #SongDetails.RI_TIM# eq 1>
            <cfset SongDetails.RI_TIM= 1>
            <cfelse>
            <cfset SongDetails.RI_TIM = 0>
            </cfif>
            
            <cfif #SongDetails.TRI_O_LA# eq "true" || #SongDetails.TRI_O_LA# eq 1>
            <cfset SongDetails.TRI_O_LA= 1>
            <cfelse>
            <cfset SongDetails.TRI_O_LA = 0>
            </cfif>
            
            <cfif #SongDetails.TI_TI_TI# eq "true" || #SongDetails.TI_TI_TI#  eq 1>
            <cfset SongDetails.TI_TI_TI= 1>
            <cfelse>
            <cfset SongDetails.TI_TI_TI = 0>
            </cfif>
            
            <cfif #SongDetails.TA_TI# eq "true" || #SongDetails.TA_TI#  eq 1>
            <cfset SongDetails.TA_TI= 1>
            <cfelse>
            <cfset SongDetails.TA_TI = 0>
            </cfif>
            
            <cfif #SongDetails.TI_TA# eq "true" || #SongDetails.TI_TA# eq 1>
            <cfset SongDetails.TI_TA= 1>
            <cfelse>
            <cfset SongDetails.TI_TA = 0>
            </cfif>
            
            <cfif #SongDetails.TAI# eq "true" || #SongDetails.TAI#  eq 1>
            <cfset SongDetails.TAI= 1>
            <cfelse>
            <cfset SongDetails.TAI = 0>
            </cfif>
            
            <cfif #SongDetails.TIM_RI_TI# eq "true" || #SongDetails.TIM_RI_TI# eq 1>
            <cfset SongDetails.TIM_RI_TI= 1>
            <cfelse>
            <cfset SongDetails.TIM_RI_TI = 0>
            </cfif>
            
            <cfif #SongDetails.RI_TIM_TI# eq "true" || #SongDetails.RI_TIM_TI#  eq 1>
            <cfset SongDetails.RI_TIM_TI= 1>
            <cfelse>
            <cfset SongDetails.RI_TIM_TI = 0>
            </cfif>
            
            <cfif #SongDetails.TI_TIM_RI# eq "true" || #SongDetails.TI_TIM_RI# eq 1>
            <cfset SongDetails.TI_TIM_RI= 1>
            <cfelse>
            <cfset SongDetails.TI_TIM_RI = 0>
            </cfif>
            
            <cfif #SongDetails.TIKA_TIKA_TIKA# eq "true" || #SongDetails.TIKA_TIKA_TIKA# eq 1>
            <cfset SongDetails.TIKA_TIKA_TIKA= 1>
            <cfelse>
            <cfset SongDetails.TIKA_TIKA_TIKA = 0>
            </cfif>
            
            <cfif #SongDetails.TIE# eq "true" || #SongDetails.TIE#  eq 1>
            <cfset SongDetails.TIE= 1>
            <cfelse>
            <cfset SongDetails.TIE = 0>
            </cfif>
            
            <cfif #SongDetails.OTHER_OTHER# eq "true" || #SongDetails.OTHER_OTHER# eq 1>
            <cfset SongDetails.OTHER_OTHER= 1>
            <cfelse>
            <cfset SongDetails.OTHER_OTHER = 0>
            </cfif>
            
            
            
            <cfif #SongDetails.ANAC# eq "true" || #SongDetails.ANAC#  eq 1>
            <cfset SongDetails.ANAC= 1>
            <cfelse>
            <cfset SongDetails.ANAC = 0>
            </cfif>
            
            <cfif #SongDetails.RI# eq "true" || #SongDetails.RI# eq 1>
                <cfset SongDetails.RI= 1>
                <cfelse>
                <cfset SongDetails.RI = 0>
                </cfif>
                
                <cfif #SongDetails.TIM# eq "true" || #SongDetails.Tim# eq 1>
                <cfset SongDetails.TIM= 1>
                <cfelse>
                <cfset SongDetails.TIM = 0>
                </cfif>
                
                <cfif #SongDetails.RI_TIM_RI# eq "true" || #SongDetails.RI_TIM_RI# eq 1>
                <cfset SongDetails.RI_TIM_RI= 1>
                <cfelse>
                <cfset SongDetails.RI_TIM_RI = 0>
                </cfif>
        <cfquery name="rhythms" datasource="kodaly_4">
            update tbl_Titles
            set   
                  
                  ta = #SongDetails.TA# ,
                  ti_ti =   #SongDetails.TI_TI#,
                  rest =  #SongDetails.REST# ,
                  ta_a = #SongDetails.TA_A#  ,
                  half_rest = #SongDetails.HALF_REST#   ,
                  ta_a_a = #SongDetails.TA_A_A#,
                  ta_a_a_a = #SongDetails.TA_A_A_A# ,
                  whole_rest = #SongDetails.WHOLE_REST# ,
                  tiri_tiri = #SongDetails.TIRI_TIRI#  ,
                  ti_tiri = #SongDetails.TI_TIRI# ,
                  tiri_ti = #SongDetails.TIRI_TI#,
                  ti_ta_ti = #SongDetails.TI_TA_TI# ,
                  tai_ti = #SongDetails.TAI_TI#,
                  ti_tai = #SongDetails.TI_TAI# ,
                  eighth_rest = #SongDetails.EIGHTH_REST#  ,
                  ti = #SongDetails.TI#  ,
                  tiri = #SongDetails.TIRI#  ,
                  tim_ri = #SongDetails.TIM_RI# ,
                  ri_tim = #SongDetails.RI_TIM# ,
                  tri_o_la = #SongDetails.TRI_O_LA#  ,
                  ti_ti_ti = #SongDetails.TI_TI_TI# ,
                  ta_ti = #SongDetails.TA_TI#  ,
                  ti_ta = #SongDetails.TI_TA# ,
                  tai = #SongDetails.TAI#,
                  tim_ri_ti = #SongDetails.TIM_RI_TI# ,
                  ri_tim_ti = #SongDetails.RI_TIM_TI#  ,
                  ti_tim_ri = #SongDetails.TI_TIM_RI# ,
                  tie = #SongDetails.TIE# ,
                  other_other = #SongDetails.OTHER_OTHER#  ,
                  Anac = #SongDetails.ANAC#  ,
                  Ri = #SongDetails.RI# ,
                  Tim = #SongDetails.TIM#  ,
                  ri_tim_ri = #SongDetails.RI_TIM_RI#
           where ID =  #songDetails.ID# 
           select 1    
       </cfquery>
               <cfset arrGirls = QueryToStruct(rhythms)/>
               <cfset objectWrapper = structNew()>
               <cfset objectWrapper.results = #arrGirls#>
               <cfreturn objectWrapper> 

    </cffunction>

    <cffunction name="saveMusicAnalysis" access="remote" returntype="any" returnformat="JSON" >
        <cfargument name="songDetails" required="true" type="ANY" > 
        <cfset songDetails = DeserializeJSON(songDetails)> 
        <cfquery name="music" datasource="kodaly_4">
             update tbl_Titles
             set  tonalCenterID = #SongDetails.TONALCENTERID# ,
            rangeID = #SongDetails.RANGEID# ,
            scaleID =  #SongDetails.SCALEID# ,
            toneSetID = '#SongDetails.TONESETID#' ,
            Starting_PitchID = #SongDetails.STARTING_PITCHID# ,
            formTypeID = #SongDetails.FORMTYPEID# ,
            meterID = #SongDetails.METERID# ,
            formID = #SongDetails.FORMID#  ,
            formAnalysisStr = '#SongDetails.FORMANALYSISSTR#' 
            where ID =  #songDetails.ID# 
            select 1    
        </cfquery>
                <cfset arrGirls = QueryToStruct(music)/>
                <cfset objectWrapper = structNew()>
                <cfset objectWrapper.results = #arrGirls#>
                <cfreturn objectWrapper> 
    </cffunction>

    <cffunction name="deleteNewsItem" access="remote" returntype="any" returnformat="JSON" >
        <cfargument name="id" required="true" type="numeric"> 
        <cfquery name="delete" datasource="kodaly_4">
           delete from dbo.tbl_News
           where id = #id#
           select 1        
        </cfquery>
        <cfset arrGirls = QueryToStruct(delete)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>    
    </cffunction>

    <cffunction name="createNewsItem" access="remote" returntype="Any" returnformat="JSON" >
		<cfargument name="newsItem" required="true" >
        <cfset newsItem = DeserializeJSON(newsItem)>
		<cfif newsItem.newsItemPostSwitch EQ 'true'>
			<cfset newsItem.newsItemPostSwitch = 1>
			<cfelse>
			<cfset newsItem.newsItemPostSwitch = 0>
		</cfif>
			<cfquery name="insertItem" datasource="kodaly_4">
							INSERT INTO dbo.tbl_News
			        ( newsItemHeadline ,
			          newsItemCopy ,
			          newsItemPostSwitch ,
			          postDate ,
			          dateString ,
			          newsTeaser
			        )
			VALUES  ( '#newsItem.newsItemHeadline#' , -- newsItemHeadline - nvarchar(1000)
			          '#newsItem.newsItemCopy#'  , -- newsItemCopy - ntext
			          #newsItem.newsItemPostSwitch# , -- newsItemPostSwitch - bit
			         
			         '#newsItem.postDate#'  , -- postDate - date
			         '#newsItem.dateString#'  , -- dateString - nvarchar(50)
			         '#newsItem.newsTeaser#'  -- newsTeaser - nvarchar(100)
			        )
			  select @@IDENTITY      
			</cfquery>
		<cfset arrGirls = QueryToStruct(insertItem)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper> 
	</cffunction>
	

	
	<cffunction name="updateNewsItem" access="remote" returntype="Any" returnformat="JSON" >
		<cfargument name="newsItem" required="true" type="any" >
        <cfset newsItem = DeserializeJSON(newsItem)>
		<cfif newsItem.NEWSITEMPOSTSWITCH EQ 'true' || newsItem.NEWSITEMPOSTSWITCH EQ 1>
			<cfset newsItem.NEWSITEMPOSTSWITCH = 1>
			<cfelse>
			<cfset newsItem.NEWSITEMPOSTSWITCH = 0>
		</cfif>
			
			<cfquery datasource="kodaly_4" name="newsItem" > 
				update tbl_News
				set
				newsItemHeadline = '#newsItem.NEWSITEMHEADLINE#' ,
		          newsItemCopy = '#newsItem.NEWSITEMCOPY#',
		          newsItemPostSwitch = #newsItem.NEWSITEMPOSTSWITCH#,
		          postDate = '#newsItem.POSTDATE#',
		          dateString = '#newsItem.DATESTRING#',
		          newsTeaser  = '#newsItem.NEWSTEASER#'
		          where id = #newsItem.ID#
                  select 1
			</cfquery>
			<cfset arrGirls = QueryToStruct(newsItem)/>
            <cfset objectWrapper = structNew()>
            <cfset objectWrapper.results = #arrGirls#>
            <cfreturn objectWrapper> 
	</cffunction>


    <cffunction name="getNewsItem" access="remote" returntype="Any" returnformat="JSON" >
		<cfargument name="ID" type="numeric" required="true" >
        <cfquery name="newsItem" datasource="kodaly_4" >
	        select id, newsItemHeadline,
              newsItemCopy,
              newsItemPostSwitch,
              convert(varchar(16), postDate, 23) as postDate,
            dateString,
            newsTeaser
            FROM         tbl_News
				where id = #ID#
		</cfquery>		
		<cfset arrGirls = QueryToStruct(newsItem)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper> 
	</cffunction>


    <cffunction name="getNewsArray" access="remote" returntype="Any" returnformat="JSON" >
		<cfquery datasource="kodaly_4" name="news">
SELECT top 10 id, newsItemHeadline,
              newsItemCopy,
              newsItemPostSwitch,
              convert(varchar(16), postDate, 23) as postDate,
            dateString,
            newsTeaser
FROM         tbl_News
ORDER BY postDate DESC
		</cfquery>		
		<cfset arrGirls = QueryToStruct(news)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>  
	</cffunction>

    <cffunction name="updateSongBasic" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="SongDetails" type="any">
        <cfset SongDetails = DeserializeJSON(SongDetails)>
        <cfif #SongDetails.ANALYZED# eq "true" || #SongDetails.ANALYZED# eq 1>
            <cfset SongDetails.ANALYZED = 1>
            <cfelse>
            <cfset #SongDetails.ANALYZED#= 0>
            </cfif>
            <cfif #SongDetails.INFINALE# eq "true" || #SongDetails.INFINALE# eq 1>
            <cfset #SongDetails.INFINALE# = 1>
            <cfelse>
            <cfset #SongDetails.INFINALE#  = 0>
            </cfif>
            <cfif #SongDetails.PROOFED_FLAG# eq "true" || SongDetails.PROOFED_FLAG eq 1>
            <cfset SongDetails.PROOFED_FLAG = 1>
            <cfelse>
            <cfset SongDetails.PROOFED_FLAG = 0>
            </cfif>
            <cfif #SongDetails.IP_STATUS# eq "true" || #SongDetails.IP_STATUS# eq 1>
            <cfset SongDetails.IP_STATUS = 1>
            <cfelse>
            <cfset SongDetails.IP_STATUS = 0>
            </cfif>
            <cfif #SongDetails.LOC# eq "true" || #SongDetails.LOC#  eq 1>
            <cfset SongDetails.LOC = 1>
            <cfelse>
            <cfset SongDetails.LOC = 0>
            </cfif>
            <cfif #SongDetails.CHILD# eq "true" || #SongDetails.CHILD# eq 1>
            <cfset SongDetails.CHILD = 1>
            <cfelse>
            <cfset SongDetails.CHILD = 0>
            </cfif>
            <cfif #SongDetails.IP_STATUS# eq "true" || #SongDetails.IP_STATUS#  eq 1>
                <cfset SongDetails.IP_STATUS= 1>
                <cfelse>
                <cfset SongDetails.IP_STATUS = 0>
                </cfif>
                    
                <cfif #SongDetails.RECORDING_FLAG# eq 'true' || #SongDetails.RECORDING_FLAG#  eq 1>
                <cfset SongDetails.RECORDING_FLAG = 1>    
                <cfelse>  
                 <cfset SongDetails.RECORDING_FLAG = 0>    
                </cfif> 
                
                <cfif #SongDetails.GAME# eq 'true' || #SongDetails.GAME#  eq 1>
                <cfset SongDetails.GAME = 1>    
                <cfelse>  
                 <cfset SongDetails.GAME = 0>    
                </cfif> 

                <cfif #SongDetails.PUBLISH# eq 'true' || #SongDetails.PUBLISH#  eq 1>
                    <cfset SongDetails.PUBLISH = 1>    
                    <cfelse>  
                     <cfset SongDetails.PUBLISH = 0>    
                    </cfif> 
        <cfquery name="edit" datasource="kodaly_4" >
              update tbl_Titles
              set Title = '#SongDetails.TITLE#' ,
                  Alt_Title_1 = '#SongDetails.ALT_TITLE_1#' ,
                  Alt_Title_2 =  '#SongDetails.ALT_TITLE_2#'  ,
                  First_Line_Text = '#SongDetails.FIRST_LINE_TEXT#' ,
                  Informant = '#SongDetails.INFORMANT#',
                  Song_Background = '#SongDetails.SONG_BACKGROUND#',
                    Recording_Flag = #SongDetails.RECORDING_FLAG#,
                    Game = #SongDetails.GAME#,
                    stateID = #SongDetails.STATEID# ,
                  regionID = #SongDetails.REGIONID# ,
                  ethnicityID =  #SongDetails.ETHNICITYID# ,
                  Publication = '#SongDetails.PUBLICATION#',
                  Comments = '#SongDetails.COMMENTS#',
                  Publish = #SongDetails.PUBLISH#,
                  IP_Status = #SongDetails.IP_STATUS#,
                  Child= #SongDetails.CHILD# ,
                  LOC = #SongDetails.LOC#,
                  Notation_File_Name = '#SongDetails.NOTATION_FILE_NAME#',
                   inFinale=#SongDetails.INFINALE# 
                  where  ID = #SongDetails.ID#   
                  select 1 

        </cfquery>
        <cfset arrGirls = QueryToStruct(edit)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>  
     </cffunction>   


    <cffunction name="updateSongComplete" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="SongDetails" type="any">
        <cfset SongDetails = DeserializeJSON(SongDetails)>
                <!--- boolean sections --->
                <cfif #SongDetails.Analyzed# eq "true" || #SongDetails.Analyzed# eq 1>
                    <cfset SongDetails.Analyzed = 1>
                    <cfelse>
                    <cfset #SongDetails.Analyzed#= 0>
                    </cfif>
                    <cfif #SongDetails.inFinale# eq "true" || #SongDetails.inFinale# eq 1>
                    <cfset #SongDetails.inFinale# = 1>
                    <cfelse>
                    <cfset #SongDetails.inFinale#  = 0>
                    </cfif>
                    <cfif #SongDetails.Proofed_Flag# eq "true" || SongDetails.Proofed_Flag eq 1>
                    <cfset SongDetails.Proofed_Flag = 1>
                    <cfelse>
                    <cfset SongDetails.Proofed_Flag = 0>
                    </cfif>
                    <cfif #SongDetails.IP_Status# eq "true" || #SongDetails.IP_Status# eq 1>
                    <cfset SongDetails.IP_Status = 1>
                    <cfelse>
                    <cfset SongDetails.IP_Status = 0>
                    </cfif>
                    <cfif #SongDetails.LoC# eq "true" || #SongDetails.LoC#  eq 1>
                    <cfset SongDetails.LoC = 1>
                    <cfelse>
                    <cfset SongDetails.LoC = 0>
                    </cfif>
                    <cfif #SongDetails.Child# eq "true" || #SongDetails.Child# eq 1>
                    <cfset SongDetails.Child = 1>
                    <cfelse>
                    <cfset SongDetails.Child = 0>
                    </cfif>
                    
                    <cfif #SongDetails.one# eq "true" || #SongDetails.one#  eq 1>
                    <cfset SongDetails.one = 1>
                    <cfelse>
                    <cfset SongDetails.one = 0>
                    </cfif>
                    
                    <cfif #SongDetails.two# eq "true" || #SongDetails.two# eq 1>
                    <cfset SongDetails.two = 1>
                    <cfelse>
                    <cfset SongDetails.two = 0>
                    </cfif>
                    
                    <cfif #SongDetails.three# eq "true" || #SongDetails.three# eq 1>
                    <cfset SongDetails.three = 1>
                    <cfelse>
                    <cfset SongDetails.three = 0>
                    </cfif>
                    
                    <cfif #SongDetails.four# eq "true" || #SongDetails.four#  eq 1>
                    <cfset SongDetails.four = 1>
                    <cfelse>
                    <cfset SongDetails.four = 0>
                    </cfif>
                    
                    <cfif #SongDetails.five# eq "true" || #SongDetails.five#  eq 1>
                    <cfset SongDetails.five = 1>
                    <cfelse>
                    <cfset SongDetails.five = 0>
                    </cfif>
                    
                    <cfif #SongDetails.six# eq "true" || #SongDetails.six#  eq 1>
                    <cfset SongDetails.six = 1>
                    <cfelse>
                    <cfset SongDetails.six = 0>
                    </cfif>
                    
                    <cfif #SongDetails.seven# eq "true" || #SongDetails.seven#  eq 1>
                    <cfset SongDetails.seven = 1>
                    <cfelse>
                    <cfset SongDetails.seven = 0>
                    </cfif>
                    
                    <cfif #SongDetails.eight# eq "true" || #SongDetails.eight#  eq 1>
                    <cfset SongDetails.eight = 1>
                    <cfelse>
                    <cfset SongDetails.eight = 0>
                    </cfif>
                    
                    <cfif #SongDetails.nine# eq "true" || #SongDetails.nine#  eq 1>
                    <cfset SongDetails.nine = 1>
                    <cfelse>
                    <cfset SongDetails.nine = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ten# eq "true" || #SongDetails.ten# eq 1>
                    <cfset SongDetails.ten = 1>
                    <cfelse>
                    <cfset SongDetails.ten = 0>
                    </cfif>
                    
                    
                    <cfif #SongDetails.k# eq "true" || #SongDetails.k# eq 1>
                    <cfset SongDetails.k = 1>
                    <cfelse>
                    <cfset SongDetails.k = 0>
                    </cfif>
                    
                    <cfif #SongDetails.zero# eq "true" || #SongDetails.zero# eq 1>
                    <cfset SongDetails.zero= 1>
                    <cfelse>
                    <cfset SongDetails.zero = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ch# eq "true" || #SongDetails.ch#  eq 1>
                    <cfset SongDetails.ch= 1>
                    <cfelse>
                    <cfset SongDetails.ch = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ta# eq "true" || #SongDetails.ta# eq 1>
                    <cfset SongDetails.ta= 1>
                    <cfelse>
                    <cfset SongDetails.ta = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ti_ti# eq "true" || #SongDetails.ti_ti#  eq 1>
                    <cfset SongDetails.ti_ti= 1>
                    <cfelse>
                    <cfset SongDetails.ti_ti = 0>
                    </cfif>
                    
                    <cfif #SongDetails.rest# eq "true" || #SongDetails.rest#  eq 1>
                    <cfset SongDetails.rest= 1>
                    <cfelse>
                    <cfset SongDetails.rest = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ta_a# eq "true" || #SongDetails.ta_a# eq 1>
                    <cfset SongDetails.ta_a= 1>
                    <cfelse>
                    <cfset SongDetails.ta_a = 0>
                    </cfif>
                    
                    <cfif #SongDetails.half_rest# eq "true" || #SongDetails.half_rest# eq 1>
                    <cfset SongDetails.half_rest= 1>
                    <cfelse>
                    <cfset SongDetails.half_rest = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ta_a_a# eq "true" || #SongDetails.half_rest#  eq 1>
                    <cfset SongDetails.ta_a_a= 1>
                    <cfelse>
                    <cfset SongDetails.ta_a_a = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ta_a_a_a# eq "true" || #SongDetails.ta_a_a_a#  eq 1>
                    <cfset SongDetails.ta_a_a_a= 1>
                    <cfelse>
                    <cfset SongDetails.ta_a_a_a = 0>
                    </cfif>
                    
                    <cfif #SongDetails.whole_rest# eq "true" || #SongDetails.whole_rest# eq 1>
                    <cfset SongDetails.whole_rest= 1>
                    <cfelse>
                    <cfset SongDetails.whole_rest = 0>
                    </cfif>
                    
                    <cfif #SongDetails.tiri_tiri# eq "true" || #SongDetails.tiri_tiri# eq 1>
                    <cfset SongDetails.tiri_tiri= 1>
                    <cfelse>
                    <cfset SongDetails.tiri_tiri = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ti_tiri# eq "true" || #SongDetails.ti_tiri#  eq 1>
                    <cfset SongDetails.ti_tiri= 1>
                    <cfelse>
                    <cfset SongDetails.ti_tiri = 0>
                    </cfif>
                    
                    <cfif #SongDetails.tiri_ti# eq "true" || #SongDetails.tiri_ti#  eq 1>
                    <cfset SongDetails.tiri_ti= 1>
                    <cfelse>
                    <cfset SongDetails.tiri_ti = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ti_ta_ti# eq "true" || #SongDetails.ti_ta_ti#  eq 1>
                    <cfset SongDetails.ti_ta_ti= 1>
                    <cfelse>
                    <cfset SongDetails.ti_ta_ti = 0>
                    </cfif>
                    
                    <cfif #SongDetails.tai_ti# eq "true" || #SongDetails.tai_ti#  eq 1>
                    <cfset SongDetails.tai_ti= 1>
                    <cfelse>
                    <cfset SongDetails.tai_ti = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ti_tai# eq "true" || #SongDetails.ti_tai# eq 1>
                    <cfset SongDetails.ti_tai= 1>
                    <cfelse>
                    <cfset SongDetails.ti_tai = 0>
                    </cfif>
                    
                    <cfif #SongDetails.eighth_rest# eq "true" || #SongDetails.eighth_rest# eq 1>
                    <cfset SongDetails.eighth_rest= 1>
                    <cfelse>
                    <cfset SongDetails.eighth_rest = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ti# eq "true" || #SongDetails.ti#  eq 1>
                    <cfset SongDetails.ti= 1>
                    <cfelse>
                    <cfset SongDetails.ti = 0>
                    </cfif>
                    
                    <cfif #SongDetails.tiri# eq "true" || #SongDetails.tiri# eq 1>
                    <cfset SongDetails.tiri= 1>
                    <cfelse>
                    <cfset SongDetails.tiri = 0>
                    </cfif>
                    
                    <cfif #SongDetails.tim_ri# eq "true" || #SongDetails.tim_ri# eq 1>
                    <cfset SongDetails.tim_ri= 1>
                    <cfelse>
                    <cfset SongDetails.tim_ri = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ri_tim# eq "true" || #SongDetails.ri_tim# eq 1>
                    <cfset SongDetails.ri_tim= 1>
                    <cfelse>
                    <cfset SongDetails.ri_tim = 0>
                    </cfif>
                    
                    <cfif #SongDetails.tri_o_la# eq "true" || #SongDetails.tri_o_la# eq 1>
                    <cfset SongDetails.tri_o_la= 1>
                    <cfelse>
                    <cfset SongDetails.tri_o_la = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ti_ti_ti# eq "true" || #SongDetails.ti_ti_ti#  eq 1>
                    <cfset SongDetails.ti_ti_ti= 1>
                    <cfelse>
                    <cfset SongDetails.ti_ti_ti = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ta_ti# eq "true" || #SongDetails.ta_ti#  eq 1>
                    <cfset SongDetails.ta_ti= 1>
                    <cfelse>
                    <cfset SongDetails.ta_ti = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ti_ta# eq "true" || #SongDetails.ti_ta# eq 1>
                    <cfset SongDetails.ti_ta= 1>
                    <cfelse>
                    <cfset SongDetails.ti_ta = 0>
                    </cfif>
                    
                    <cfif #SongDetails.tai# eq "true" || #SongDetails.tai#  eq 1>
                    <cfset SongDetails.tai= 1>
                    <cfelse>
                    <cfset SongDetails.tai = 0>
                    </cfif>
                    
                    <cfif #SongDetails.tim_ri_ti# eq "true" || #SongDetails.tim_ri_ti# eq 1>
                    <cfset SongDetails.tim_ri_ti= 1>
                    <cfelse>
                    <cfset SongDetails.tim_ri_ti = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ri_tim_ti# eq "true" || #SongDetails.ri_tim_ti#  eq 1>
                    <cfset SongDetails.ri_tim_ti= 1>
                    <cfelse>
                    <cfset SongDetails.ri_tim_ti = 0>
                    </cfif>
                    
                    <cfif #SongDetails.ti_tim_ri# eq "true" || #SongDetails.ti_tim_ri# eq 1>
                    <cfset SongDetails.ti_tim_ri= 1>
                    <cfelse>
                    <cfset SongDetails.ti_tim_ri = 0>
                    </cfif>
                    
                    <cfif #SongDetails.tika_tika_tika# eq "true" || #SongDetails.tika_tika_tika# eq 1>
                    <cfset SongDetails.tika_tika_tika= 1>
                    <cfelse>
                    <cfset SongDetails.tika_tika_tika = 0>
                    </cfif>
                    
                    <cfif #SongDetails.tie# eq "true" || #SongDetails.tie#  eq 1>
                    <cfset SongDetails.tie= 1>
                    <cfelse>
                    <cfset SongDetails.tie = 0>
                    </cfif>
                    
                    <cfif #SongDetails.other_other# eq "true" || #SongDetails.other_other# eq 1>
                    <cfset SongDetails.other_other= 1>
                    <cfelse>
                    <cfset SongDetails.other_other = 0>
                    </cfif>
                    
                    
                    
                    <cfif #SongDetails.Anac# eq "true" || #SongDetails.Anac#  eq 1>
                    <cfset SongDetails.Anac= 1>
                    <cfelse>
                    <cfset SongDetails.Anac = 0>
                    </cfif>
                    
                    <cfif #SongDetails.Ri# eq "true" || #SongDetails.Ri# eq 1>
                        <cfset SongDetails.Ri= 1>
                        <cfelse>
                        <cfset SongDetails.Ri = 0>
                        </cfif>
                        
                        <cfif #SongDetails.Tim# eq "true" || #SongDetails.Tim# eq 1>
                        <cfset SongDetails.Tim= 1>
                        <cfelse>
                        <cfset SongDetails.Tim = 0>
                        </cfif>
                        
                        <cfif #SongDetails.ri_tim_ri# eq "true" || #SongDetails.ri_tim_ri# eq 1>
                        <cfset SongDetails.ri_tim_ri= 1>
                        <cfelse>
                        <cfset SongDetails.ri_tim_ri = 0>
                        </cfif>
                        
                        <cfif #SongDetails.IP_Status# eq "true" || #SongDetails.IP_Status#  eq 1>
                        <cfset SongDetails.IP_Status= 1>
                        <cfelse>
                        <cfset SongDetails.IP_Status = 0>
                        </cfif>
                            
                        <cfif #SongDetails.Recording_Flag# eq 'true' || #SongDetails.Recording_Flag#  eq 1>
                        <cfset SongDetails.Recording_Flag = 1>    
                        <cfelse>  
                         <cfset SongDetails.Recording_Flag = 0>    
                        </cfif> 
                        
                        <cfif #SongDetails.Game# eq 'true' || #SongDetails.Game#  eq 1>
                        <cfset SongDetails.Game = 1>    
                        <cfelse>  
                         <cfset SongDetails.Game = 0>    
                        </cfif> 
           
        
        <cfquery name="editSong" datasource="kodaly_4">
                     update tbl_Titles
                    set
                    Title = '#SongDetails.Title#' ,
                  Alt_Title_1 = '#SongDetails.Alt_Title_1#' ,
                  Alt_Title_2 =  '#SongDetails.Alt_Title_2#'  ,
                  First_Line_Text = '#SongDetails.First_Line_Text#' ,
                  Informant = '#SongDetails.Informant#',
                  scaleID =  #SongDetails.scaleID# ,
                  NOTE = #SongDetails.NOTE# ,
                  tonalCenterID = #SongDetails.tonalCenterID#  ,
                  meterID = #SongDetails.meterID# ,
                  formID = #SongDetails.formID#  ,
        
        
                  stateID = #SongDetails.stateID# ,
                  regionID = #SongDetails.regionID# ,
        
                  rangeID = #SongDetails.rangeID# ,
                  toneSetID = '#SongDetails.toneSetID#' ,
        
                  formAnalysisStr = '#SongDetails.formAnalysisStr#' ,
                  Analyzed =  #SongDetails.Analyzed# ,
        
                  inFinale = #SongDetails.inFinale#  ,
                  Starting_PitchID = #SongDetails.Starting_PitchID# ,
                  ethnicityID =  #SongDetails.ethnicityID# ,
                  Publication = '#SongDetails.Publication#' ,
                  Comments = '#SongDetails.Comments#' ,
                  formTypeID = #SongDetails.formTypeID# ,
        
                  Notation_File_Name = '#SongDetails.Notation_File_Name#' ,
        
                  one = #SongDetails.one# ,
                  two = #SongDetails.two# ,
                  three = #SongDetails.three# ,
                  four =  #SongDetails.four# ,
                  five =  #SongDetails.five# ,
                  six =  #SongDetails.six#,
                  seven =   #SongDetails.seven# ,
                  eight =   #SongDetails.eight# ,
                  nine =  #SongDetails.nine#,
                  ten = #SongDetails.ten# ,
                
                  k =  #SongDetails.k# ,
                  zero =  #SongDetails.zero#,
                  ch =  #SongDetails.ch# ,
                  ta = #SongDetails.ta# ,
                  ti_ti =   #SongDetails.ti_ti#,
                  rest =  #SongDetails.rest# ,
                  ta_a = #SongDetails.ta_a#  ,
                  half_rest = #SongDetails.half_rest#   ,
                  ta_a_a = #SongDetails.ta_a_a#,
                  ta_a_a_a = #SongDetails.ta_a_a_a# ,
                  whole_rest = #SongDetails.whole_rest# ,
                  tiri_tiri = #SongDetails.tiri_tiri#  ,
                  ti_tiri = #SongDetails.ti_tiri# ,
                  tiri_ti = #SongDetails.tiri_ti#,
                  ti_ta_ti = #SongDetails.ti_ta_ti# ,
                  tai_ti = #SongDetails.tai_ti#,
                  ti_tai = #SongDetails.ti_tai# ,
                  eighth_rest = #SongDetails.eighth_rest#  ,
                  ti = #SongDetails.ti#  ,
                  tiri = #SongDetails.tiri#  ,
                  tim_ri = #SongDetails.tim_ri# ,
                  ri_tim = #SongDetails.ri_tim# ,
                  tri_o_la = #SongDetails.tri_o_la#  ,
                  ti_ti_ti = #SongDetails.ti_ti_ti# ,
                  ta_ti = #SongDetails.ta_ti#  ,
                  ti_ta = #SongDetails.ti_ta# ,
                  tai = #SongDetails.tai#,
                  tim_ri_ti = #SongDetails.tim_ri_ti# ,
                  ri_tim_ti = #SongDetails.ri_tim_ti#  ,
                  ti_tim_ri = #SongDetails.ti_tim_ri# ,
                  tie = #SongDetails.tie# ,
                  other_other = #SongDetails.other_other#  ,
                  Anac = #SongDetails.Anac#  ,
                  Ri = #SongDetails.Ri# ,
                  Tim = #SongDetails.Tim#  ,
                  ri_tim_ri = #SongDetails.ri_tim_ri# ,
                  IP_Status = #SongDetails.IP_Status#  ,
                  Proofed_Flag = #SongDetails.Proofed_Flag# ,
                  LoC = #SongDetails.LoC# ,
                  Child = #SongDetails.Child#,
                  Grade_String =  '#SongDetails.Grade_String#',
                  Song_Background = '#SongDetails.Song_Background#',
                    Recording_Flag = #SongDetails.Recording_Flag#,
                    Game = #SongDetails.Game#
                  where ID = #SongDetails.ID#
                  select 1
        </cfquery>
        <cfset arrGirls = QueryToStruct(editSong)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>  
        </cffunction>

    <cffunction name="getPartWorkForSong" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="titleKey" type="numeric" required="yes">
        <cfquery name="partWork" datasource="kodaly_4">
        SELECT     [tbl Title Part Work].[Title Part Work Key] AS titlePartKey, [tbl Title Part Work].[Title Key] AS titleKey, [tbl Title Part Work].[Part Work Key] AS partWorkKey, 
                              [tbl Title Part Work].Part_Work_Context_String, [tbl Part Work].[Part Work Description] AS partWorkName
        FROM         [tbl Title Part Work] INNER JOIN
                              [tbl Part Work] ON [tbl Title Part Work].[Part Work Key] = [tbl Part Work].[Part Work Key]
                              WHERE [Title Key] = #titleKey#
        </cfquery>
        <cfset arrGirls = QueryToStruct(partWork)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>  
        </cffunction>
        
        <cffunction name="getPartWorkNames" access="remote" returntype="any" returnformat="JSON">
        <cfquery name="partWorkNames" datasource="kodaly_4">
        SELECT [Part Work Key] AS data
              ,[Part Work Sequence Number] as sequence
              ,[Part Work Description] AS label
          FROM [tbl Part Work]
          ORDER BY [Part Work Description]
        </cfquery>
         <cfset arrGirls = QueryToStruct(partWorkNames)/>
         <cfset objectWrapper = structNew()>
         <cfset objectWrapper.results = #arrGirls#>
         <cfreturn objectWrapper>    
        </cffunction>
        
        <cffunction name="insertPartWorkForSong" access="remote" returntype="any"  returnformat="JSON">
        <cfargument name="titleKey" type="any">
        <cfargument name="partWorkKey" type="any">
        <cfargument name="partWorkContextString" type="any">
        <cfquery name="insertPartWork" datasource="kodaly_4">
        
        
        INSERT INTO dbo.[tbl Title Part Work]
                ( [Title Key] ,
                  [Part Work Key] ,
                  Part_Work_Context_String
                )
        VALUES  ( #titleKey# , -- Title Key - int
                  #partWorkKey# , -- Part Work Key - int
                  '#partWorkContextString#' -- Part_Work_Context_String - nvarchar(50)
                )
           select @@identity
         </cfquery>
          <cfset arrGirls = QueryToStruct(insertPartWork)/>
          <cfset objectWrapper = structNew()>
          <cfset objectWrapper.results = #arrGirls#>
          <cfreturn objectWrapper>    
        </cffunction>
        

        <cffunction name="deletePartWorkForSong" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="tableID" type="numeric" required="yes">
        <cfquery name="deletePart" datasource="kodaly_4">
        DELETE FROM dbo.[tbl Title Part Work]
        WHERE [Title Part Work Key] = #tableID#
        select 1
        </cfquery>
         <cfset arrGirls = QueryToStruct(deletePart)/>
         <cfset objectWrapper = structNew()>
         <cfset objectWrapper.results = #arrGirls#>
         <cfreturn objectWrapper>
        </cffunction>
        


    <cffunction name="getSubjectObject" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="id" type="numeric" required="yes">
        <cfquery name="subjects" datasource="kodaly_4">
        SELECT    [tbl Title Subject Headings].ID_Title_Subject, [tbl Title Subject Headings].[Title Key] AS titleKey, 
                              [tbl Title Subject Headings].[Subject Heading Key] AS subjectKey, [tbl Title Subject Headings].Sub_Subject_Key AS subSubjectKey, 
                              [tbl Subject Headings].[Subject Heading] AS subjectHeading, Tbl_Sub_Subjects.Sub_Subject AS subSubjectHeading
        FROM         [tbl Title Subject Headings] INNER JOIN
                              [tbl Subject Headings] ON [tbl Title Subject Headings].[Subject Heading Key] = [tbl Subject Headings].[Subject Heading Key] INNER JOIN
                              Tbl_Sub_Subjects ON [tbl Title Subject Headings].Sub_Subject_Key = Tbl_Sub_Subjects.Sub_Subject_Key
        WHERE     ([tbl Title Subject Headings].[ID_Title_Subject] = #id#)
        </cfquery>
        
        <cfset arrGirls = QueryToStruct(subjects)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
        </cffunction>

    <cffunction name="getSubjectsForSong" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="titleKey" type="numeric" required="yes" default="455">
        <cfquery name="subjects" datasource="kodaly_4">
        SELECT    [tbl Title Subject Headings].ID_Title_Subject, [tbl Title Subject Headings].[Title Key] AS titleKey, 
                              [tbl Title Subject Headings].[Subject Heading Key] AS subjectKey, [tbl Title Subject Headings].Sub_Subject_Key AS subSubjectKey, 
                              [tbl Subject Headings].[Subject Heading] AS subjectHeading, Tbl_Sub_Subjects.Sub_Subject AS subSubjectHeading
        FROM         [tbl Title Subject Headings] INNER JOIN
                              [tbl Subject Headings] ON [tbl Title Subject Headings].[Subject Heading Key] = [tbl Subject Headings].[Subject Heading Key] INNER JOIN
                              Tbl_Sub_Subjects ON [tbl Title Subject Headings].Sub_Subject_Key = Tbl_Sub_Subjects.Sub_Subject_Key
        WHERE     ([tbl Title Subject Headings].[Title Key] = #titleKey#)
        </cfquery>
        
        <cfset arrGirls = QueryToStruct(subjects)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
        </cffunction>
        

        <cffunction name="getSubjects" access="remote" returntype="any" returnformat="JSON">
        <cfquery name="subjectHeading" datasource="kodaly_4">
        SELECT     [Subject Heading Key] AS data, [Subject Heading] AS label
        FROM         [tbl Subject Headings]
        ORDER BY label
        </cfquery>
         <cfset arrGirls = QueryToStruct(subjectHeading)/>
         <cfset objectWrapper = structNew()>
         <cfset objectWrapper.results = #arrGirls#>
         <cfreturn objectWrapper>
        </cffunction>
        
        <cffunction name="getSubSubjects" access="remote" returntype="any"returnformat="JSON">
        <cfargument name="mainSubject" required="yes" type="numeric">
        <cfquery name="getRelatedTypes" datasource="kodaly_4">
        SELECT [id]
              ,[Sub_Subject_Key] as data
              ,[Sub_Subject] AS label
              ,[Subject Heading Key] AS subjectHeadingKey
          FROM [Tbl_Sub_Subjects]
          WHERE [Subject Heading Key] = #mainSubject# OR [Sub_Subject_Key] = 29
          order by [Sub_Subject]
        </cfquery>
        <cfset arrGirls = QueryToStruct(getRelatedTypes)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
        </cffunction>
        
        <cffunction name="insertNewSubject" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="titleKey" type="any" required="yes">
        <cfargument name="subjectKey" type="any" required="yes">
        <cfargument name="subsubjectKey" type="any" required="yes">
        <cfquery name="insertSubject" datasource="kodaly_4">
        INSERT INTO dbo.[tbl Title Subject Headings]
                ( [Title Key] ,
                  [Subject Heading Key] ,
                  Sub_Subject_Key
                )
        VALUES  ( #titleKey# , -- Title Key - int
                  #subjectKey# , -- Subject Heading Key - int
                  #subSubjectKey#  -- Sub_Subject_Key - int
                )
                select @@identity
        </cfquery>
        <cfset arrGirls = QueryToStruct(insertSubject)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
        </cffunction>
        
        
        <cffunction name="deleteSubjectFromSong" access="remote" returntype="any" returnformat="JSON">
        <cfargument  name="ID_Title_Subject" required="yes" type="numeric">
        <cfquery name="deleteSubject" datasource="kodaly_4">
        DELETE FROM dbo.[tbl Title Subject Headings] 
        WHERE ID_Title_Subject = #ID_Title_Subject#
        Select 1
        </cfquery>
        <cfreturn deleteSubject>
        </cffunction>

    <cffunction name="getFigures" access="remote" returntype="any" returnformat="JSON">
        <cfquery name="figures" datasource="kodaly_4">
        select Figure_ID AS data, Figure AS label
        FROM tbl_Figures
        ORDER BY Figure
        </cfquery>
        <cfset arrGirls = QueryToStruct(figures)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
        </cffunction>
        
        <cffunction name="getFiguresForSong" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="titleKey" type="numeric" required="yes">
        <cfquery name="figuresForSong" datasource="kodaly_4">
        SELECT     TOP (1000) Tbl_Title_Figures.Figure_Title_ID, Tbl_Figures.Figure, Tbl_Title_Figures.Title_Key
        FROM         Tbl_Title_Figures INNER JOIN
                              Tbl_Figures ON Tbl_Title_Figures.Figure_ID = Tbl_Figures.Figure_ID
                              WHERE Title_Key = #titleKey#
        </cfquery>
        <cfset arrGirls = QueryToStruct(figuresForSong)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
        </cffunction>
        
        <cffunction name="getFigureObject" access="remote" returntype="any" returnformat="JSON" >
        <cfargument name="id" type="numeric" >
        <cfquery datasource="kodaly_4" name="object">
            select * from Tbl_Title_Figures
            where Figure_Title_ID = #id#      
        </cfquery>
         <cfset arrGirls = QueryToStruct(object)/>
         <cfset objectWrapper = structNew()>
         <cfset objectWrapper.results = #arrGirls#>
         <cfreturn objectWrapper>            
        </cffunction>

        <cffunction name="addFigureToSong" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="titleKey" type="any" required="yes">
        <cfargument name="figureID" type="any" required="yes">
        <cfquery name="addFigure" datasource="kodaly_4">
        INSERT INTO dbo.Tbl_Title_Figures
                ( Title_Key, Figure_ID )
        VALUES  ( #titleKey#, 
                  #figureID#  
                  )
        select @@identity          
        </cfquery>
         <cfset arrGirls = QueryToStruct(addFigure)/>
         <cfset objectWrapper = structNew()>
         <cfset objectWrapper.results = #arrGirls#>
         <cfreturn objectWrapper>
        </cffunction>
        
        <cffunction name="deleteFigureFromSong" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="Figure_Title_ID" type="numeric" required="yes">
        <cfquery name="removeFigure" datasource="kodaly_4">
        DELETE FROM [Tbl_Title_Figures]
          WHERE Figure_Title_ID = #Figure_Title_ID#
          select 1
        </cfquery>
         <cfset arrGirls = QueryToStruct(removeFigure)/>
         <cfset objectWrapper = structNew()>
         <cfset objectWrapper.results = #arrGirls#>
         <cfreturn objectWrapper>
        </cffunction>


     
    

    <cffunction name="getGamesForSong" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="titleKey" type="numeric" required="yes">
        <cfquery name="getGames" datasource="kodaly_4">
        SELECT     [tbl Title Game Type].[Title Key] AS titleKey, [tbl Title Game Type].[Game Type Key] AS gameTypeKey, 
                              [tbl Title Game Type].Sub_Game_Type_Key AS subGameTypeKey, [tbl Title Game Type].Table_Key AS id, [tbl Game Type].[Game Type] AS gameType, 
                              [tbl Game Type].Subgame_Flag, Table_Sub_Game_Type.Sub_Game_Type AS subGameType
        FROM         [tbl Title Game Type] INNER JOIN
                              [tbl Game Type] ON [tbl Title Game Type].[Game Type Key] = [tbl Game Type].[Game Type Key] INNER JOIN
                              Table_Sub_Game_Type ON [tbl Title Game Type].Sub_Game_Type_Key = Table_Sub_Game_Type.Game_Subtype_ID
        WHERE     ([tbl Title Game Type].[Title Key] = #titleKey#)
        </cfquery>
        <cfset arrGirls = QueryToStruct(getGames)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
        </cffunction>
        
        <cffunction name="getGameTypeObject" access="remote" returntype="any" returnformat="JSON">
            <cfargument name="tableKey" type="numeric" required="true" >
            <cfquery name="tableKey" datasource="kodaly_4">
                SELECT     [tbl Title Game Type].[Title Key] AS titleKey, [tbl Title Game Type].[Game Type Key] AS gameTypeKey, 
                              [tbl Title Game Type].Sub_Game_Type_Key AS subGameTypeKey, [tbl Title Game Type].Table_Key AS id, [tbl Game Type].[Game Type] AS gameType, 
                              [tbl Game Type].Subgame_Flag, Table_Sub_Game_Type.Sub_Game_Type AS subGameType
        FROM         [tbl Title Game Type] INNER JOIN
                              [tbl Game Type] ON [tbl Title Game Type].[Game Type Key] = [tbl Game Type].[Game Type Key] INNER JOIN
                              Table_Sub_Game_Type ON [tbl Title Game Type].Sub_Game_Type_Key = Table_Sub_Game_Type.Game_Subtype_ID
                where Table_Key = #tableKey#
            </cfquery>
            <cfset arrGirls = QueryToStruct(tableKey)/>
            <cfset objectWrapper = structNew()>
            <cfset objectWrapper.results = #arrGirls#>
            <cfreturn objectWrapper>
        </cffunction>

        <cffunction name="getGameTypes" access="remote" returntype="any" returnformat="JSON">
        <cfquery name="gameTypes" datasource="kodaly_4">
        SELECT     [Game Type Key] AS data, [Game Type] AS label
        FROM         [tbl Game Type]
        WHERE [Game Type Key]<>21
        ORDER BY [Game Type]
        </cfquery>
        <cfset arrGirls = QueryToStruct(gameTypes)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
        </cffunction>
        
        <cffunction name="getRelatedGameTypes" access="REMOTE" returntype="any" returnformat="JSON">
        <cfargument name="gameTypeKey" type="numeric" required="yes">
        <cfquery name="relatedGames" datasource="kodaly_4">
        SELECT     Game_Subtype_ID AS data, Sub_Game_Type AS label
        FROM         Table_Sub_Game_Type
        WHERE     (relatedGameType = #gameTypeKey#)
        </cfquery>
        <cfset arrGirls = QueryToStruct(relatedGames)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
        </cffunction>
        
        <cffunction name="insertGameTypeForSong" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="TitleKey" required="yes" type="any">
        <cfargument name="GameTypeKey" required="yes" type="any">
        <cfargument name="SubGameTypeKey" required="yes" type="any">

        <cfquery name="insertGameType" datasource="kodaly_4">
        INSERT INTO dbo.[tbl Title Game Type]
                  ( [Title Key] ,
                    [Game Type Key] ,
                    Sub_Game_Type_Key
                  )
          VALUES  ( #TitleKey#, 
                    #GameTypeKey# ,
                    #SubGameTypeKey# 
                  )
                  select @@IDENTITY
        </cfquery>
         <cfset arrGirls = QueryToStruct(insertGameType)/>
         <cfset objectWrapper = structNew()>
         <cfset objectWrapper.results = #arrGirls#>
         <cfreturn objectWrapper>
        </cffunction>
        
        <cffunction name="deleteGameTypeForSong" access="remote" returntype="any">
        <cfargument name="id" type="numeric" required="yes">
        <cfquery name="delete" datasource="kodaly_4">
        DELETE FROM dbo.[tbl Title Game Type]
                  WHERE Table_Key = #id#
                  select 1
        </cfquery>
        <cfreturn delete>
        </cffunction>
     
    <cffunction name="deleteSongTypeForSong" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="id" type="numeric" required="yes">
        <cfquery name="deleteSongTypeRecord" datasource="kodaly_4">
        DELETE FROM dbo.[tbl Title Song Type]
        WHERE id = #id#
        select 1
        </cfquery>
        <cfset arrGirls = QueryToStruct(deleteSongTypeRecord)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
    </cffunction>

    <cffunction name="getSongTypesForSong" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="titleKey" type="numeric" required="yes">
        <cfquery name="songTypes" datasource="kodaly_4">
        SELECT     [tbl Title Song Type].id, [tbl Title Song Type].[Title Key] as titleKey, [tbl Title Song Type].[Song Type Key] as songTypeKey, [tbl Song Types].[Song Type] as songType
        FROM         [tbl Title Song Type] INNER JOIN
                          [tbl Song Types] ON [tbl Title Song Type].[Song Type Key] = [tbl Song Types].[Song Type Key]
                          WHERE [Title Key] = #titleKey#
        </cfquery>
       <cfset arrGirls = QueryToStruct(songTypes)/>
       <cfset objectWrapper = structNew()>
       <cfset objectWrapper.results = #arrGirls#>
       <cfreturn objectWrapper>
        </cffunction>
        
        <cffunction name="getSongTypes" access="remote" returntype="any" returnformat="JSON">
        <cfquery name="songTypes" datasource="kodaly_4">
        SELECT     [Song Type Key] AS data, [Song Type] AS label
        FROM         [tbl Song Types]
        WHERE [Song Type]IS NOT NULL AND [Song Type Key]<>81
        ORDER BY [Song Type]
        </cfquery>
         <cfset arrGirls = QueryToStruct(songTypes)/>
         <cfset objectWrapper = structNew()>
         <cfset objectWrapper.results = #arrGirls#>
         <cfreturn objectWrapper>
        </cffunction>
        
        <cffunction name="insertSongTypeForSong" access="remote" returntype="any" returnformat="JSON">
       <cfargument name="titleKey" type="any" required="true" >
       <cfargument name="songTypeKey" type="any" required="true" >
        <cfquery name="insertSongType" datasource="kodaly_4">
        INSERT INTO dbo.[tbl Title Song Type]
            ( [Title Key], [Song Type Key] )
            VALUES  ( #titleKey#, 
              #songTypeKey# 
              )  
              select 1            
        </cfquery>
        <cfset arrGirls = QueryToStruct(insertSongType)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
        </cffunction>

    <cffunction name="saveGrades" access="remote" returntype="any" returnformat="JSON" >
      <cfargument name="gradeObject" type="any" >
      <cfset gradeObject = DeserializeJSON(gradeObject)>

      <cfset gradeObject.CH = checkForTrue(gradeObject.CH)>
      <cfset gradeObject.K = checkForTrue(gradeObject.K)>
      <cfset gradeObject.ONE = checkForTrue(gradeObject.ONE)>
      <cfset gradeObject.TWO = checkForTrue(gradeObject.TWO)>
      <cfset gradeObject.THREE = checkForTrue(gradeObject.THREE)>
      <cfset gradeObject.FOUR = checkForTrue(gradeObject.FOUR)>
      <cfset gradeObject.FIVE = checkForTrue(gradeObject.FIVE)>
      <cfset gradeObject.SIX = checkForTrue(gradeObject.SIX)>
      <cfset gradeObject.SEVEN = checkForTrue(gradeObject.SEVEN)>
      <cfset gradeObject.EIGHT = checkForTrue(gradeObject.EIGHT)>
      <cfset gradeObject.TEN = checkForTrue(gradeObject.TEN)>
      <cfset gradeObject.ZERO = checkForTrue(gradeObject.ZERO)>

      <cfquery datasource="kodaly_4" name="grades">
               update tbl_Titles
               set Grade_String = '#gradeObject.GRADE_STRING#',
               ch = #gradeObject.CH#,
               k=#gradeObject.K#,
                one=#gradeObject.ONE#,
                two=#gradeObject.TWO#,
                three=#gradeObject.THREE#,
                four=#gradeObject.FOUR#,
                five=#gradeObject.FIVE#,
                six=#gradeObject.SIX#,
                seven=#gradeObject.SEVEN#,
                eight=#gradeObject.EIGHT#,
                ten=#gradeObject.TEN#,
                zero=#gradeObject.ZERO#
                where id = #gradeObject.TITLEKEY#
                select 1
            </cfquery>
        <cfset arrGirls = QueryToStruct(grades)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
    </cffunction>

    <cffunction name="getGrades" access="remote" returntype="any" returnformat="JSON" >
        <cfargument name="titleKey" type="numeric" required="true">
                <cfquery datasource="kodaly_4" name="grades">
                    select  one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, k, zero, ch, Grade_String from tbl_Titles
                    where ID = #titleKey#
                </cfquery>
            <cfset arrGirls = QueryToStruct(grades)/>
            <cfset objectWrapper = structNew()>
            <cfset objectWrapper.results = #arrGirls#>
            <cfreturn objectWrapper>
    </cffunction>

    <cffunction name="insertMotive" access="remote" returntype="Any" returnformat="JSON">
        <cfargument name="titleID" type="numeric" required="true">
        <cfargument name="motive" type="any" required="true">
        <cfquery name="motive" datasource="kodaly_4">
            insert into tbl_Title_Motive
            (
              title_ID,
              motive  
            )VALUES(
                #titleID#,
                '#motive#'
            )
            select 1
        </cfquery>
        <cfset arrGirls = QueryToStruct(motive)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
    </cffunction>

    <cffunction name="deleteMotive" access="remote" returntype="Any" returnformat="JSON">
        <cfargument name="titleID" type="numeric" required="true">
        <cfargument name="motive" type="any" required="true">
        <cfquery name="motive" datasource="kodaly_4">
          delete from tbl_Title_Motive
            WHERE     (title_ID = #titleID#)AND motive='#motive#' 
            select 1 
        </cfquery>
        <cfset arrGirls = QueryToStruct(motive)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
    </cffunction>

    <cffunction name="getMotive" access="remote" returntype="Any" returnformat="JSON">
        <cfargument name="titleID" type="numeric" required="true">
        <cfargument name="motive" type="any" required="true">
        <cfquery name="motive" datasource="kodaly_4">
          SELECT     title_ID, motive
            FROM         tbl_Title_Motive
            WHERE     (title_ID = #titleID#)AND motive='#motive#'  
        </cfquery>
        <cfset arrGirls = QueryToStruct(motive)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
    </cffunction>

    <cffunction name="getMotivesForSong" access="remote" returntype="Any" returnformat="JSON">
        <cfargument name="titleKey" type="numeric" required="true">
        <cfquery name="motivesForSong" datasource="kodaly_4">
          SELECT     title_ID, motive
            FROM         tbl_Title_Motive
            WHERE     (title_ID = #titleKey#)  
        </cfquery>
        <cfset arrGirls = QueryToStruct(motivesForSong)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
    </cffunction>

    <cffunction name="getRhythmicContext" access="remote" returntype="any" returnformat="JSON" >
          <cfargument name="id" required="true" type="numeric" >
          <cfquery name="context" datasource="kodaly_4" >
                SELECT   [tbl Title Rhythmic Element].id,   [tbl Title Rhythmic Element].[Title Key] AS titleKey, [tbl Title Rhythmic Element].RPreparation,
           [tbl Title Rhythmic Element].[REarly Practice] AS rEarly, [tbl Rhythmic Elements].[Rhythm Name] AS rythmName,
           [tbl Title Rhythmic Element].[RMiddle Practice] AS rMiddle, [tbl Title Rhythmic Element].[RLate Practice] AS rLate,
           [tbl Rhythmic Elements].[Rhythm Key] AS rhythmKey
FROM         [tbl Title Rhythmic Element] INNER JOIN
             [tbl Rhythmic Elements] ON [tbl Title Rhythmic Element].[Rhythmic Element Key] = [tbl Rhythmic Elements].[Rhythm Key]
WHERE     ([tbl Title Rhythmic Element].id= #id#)
          </cfquery>
           <cfset arrGirls = QueryToStruct(context)/>
           <cfset objectWrapper = structNew()>
           <cfset objectWrapper.results = #arrGirls#>
           <cfreturn objectWrapper>
     </cffunction>

     <cffunction name="deleteRhythmicContext" access="remote" returntype="any" returnformat="JSON" >
           <cfargument name="id" type="numeric" required="true" >
           <cfquery name="context" datasource="kodaly_4" >
               delete from [tbl Title Rhythmic Element]
               where id =#id#
               select 1 
           </cfquery>
          <cfset arrGirls = QueryToStruct(context)/>
          <cfset objectWrapper = structNew()>
          <cfset objectWrapper.results = #arrGirls#>
          <cfreturn objectWrapper> 
    </cffunction>


    <cffunction name="getRythmicContextsForSong" access="remote" returntype="Any" returnformat="JSON">
        <cfargument name="titleKey" type="numeric" required="true">
        <cfquery name="rythmicContexts" datasource="kodaly_4">
    SELECT     [tbl Title Rhythmic Element].id, [tbl Title Rhythmic Element].[Title Key] AS titleKey, [tbl Title Rhythmic Element].RPreparation, 
                          [tbl Title Rhythmic Element].[REarly Practice] AS rEarly, [tbl Rhythmic Elements].[Rhythm Name] AS rythmName, 
                          [tbl Title Rhythmic Element].[RMiddle Practice] AS rMiddle, [tbl Title Rhythmic Element].[RLate Practice] AS rLate, 
                          [tbl Rhythmic Elements].[Rhythm Key] AS rhythmKey
    FROM         [tbl Title Rhythmic Element] INNER JOIN
                          [tbl Rhythmic Elements] ON [tbl Title Rhythmic Element].[Rhythmic Element Key] = [tbl Rhythmic Elements].[Rhythm Key]
    WHERE     ([tbl Title Rhythmic Element].[Title Key] = #titleKey#)
         </cfquery>
         <cfset arrGirls = QueryToStruct(rythmicContexts)/>
         <cfset objectWrapper = structNew()>
         <cfset objectWrapper.results = #arrGirls#>
         <cfreturn objectWrapper>
    </cffunction>


    <cffunction name="getRythmicContexts" access="remote" returntype="any" returnformat="JSON">
        <cfquery name="elements" datasource="kodaly_4">
    SELECT [Rhythm Key] as id, [Rhythm Name] as label
    FROM dbo.[tbl Rhythmic Elements]
    WHERE [Rhythm Name] IS NOT NULL
    ORDER BY [Rhythm Name]
    </cfquery>
        <cfset arrGirls = QueryToStruct(elements)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
        </cffunction>
    

    <cffunction name="deleteMelodicContext" access="remote" returntype="any" returnformat="JSON" >
        <cfargument name="id" required="true" type="numeric">

        <cfquery name="del" datasource="kodaly_4" > 
                delete from [tbl Title Melodic Element]
                where id =#id#
        </cfquery>
       <cfreturn 1>     
    </cffunction>


    <cffunction name="updateRhythmicContext" access="remote" returntype="any" returnformat="JSON" >
        <cfargument name="rhythmicContext" type="any" required="yes">
        <cfset rhythmicContext = DeserializeJSON(rhythmicContext)>
        <cfset rhythmicContext.REARLY = checkForTrue(rhythmicContext.REARLY)>
        <cfset rhythmicContext.RLATE = checkForTrue(rhythmicContext.RLATE)>
        <cfset rhythmicContext.RMIDDLE = checkForTrue(rhythmicContext.RMIDDLE)>
        <cfset rhythmicContext.RPREPARATION = checkForTrue(rhythmicContext.RPREPARATION)>
        
            <cfquery name="update" datasource="kodaly_4" > 
                update [tbl Title Rhythmic Element]
            set   [REarly Practice]=#rhythmicContext.REARLY#,
                [Rhythmic Element context]='#rhythmicContext.RYTHMNAME#',
                [Rhythmic Element Key]=#rhythmicContext.RHYTHMKEY#,
                [RLate Practice]=#rhythmicContext.RLATE#,
                [RMiddle Practice]=#rhythmicContext.RMIDDLE# ,
                RPreparation=#rhythmicContext.RPREPARATION#,
                [Title Key] = #rhythmicContext.TITLEKEY#
            where id = #rhythmicContext.ID#
            select #rhythmicContext.ID#
            </cfquery>
        <cfset arrGirls = QueryToStruct(update)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper> 
    </cffunction>


    <cffunction name="insertNewRhythmicContext" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="rhythmicContext" type="any" required="yes">
        <cfset rhythmicContext = DeserializeJSON(rhythmicContext)>
        <cfset rhythmicContext.REARLY = checkForTrue(rhythmicContext.REARLY)>
        <cfset rhythmicContext.RLATE = checkForTrue(rhythmicContext.RLATE)>
        <cfset rhythmicContext.RMIDDLE = checkForTrue(rhythmicContext.RMIDDLE)>
        <cfset rhythmicContext.RPREPARATION = checkForTrue(rhythmicContext.RPREPARATION)>
        <cfquery name="insert" datasource="kodaly_4" > 
            insert into [tbl Title Rhythmic Element]
            ([Title Key],
            [Rhythmic Element Key], 
            RPreparation,
            [REarly Practice],
            [RMiddle Practice],
            [RLate Practice]) 
            values 
                (
                #rhythmicContext.TITLEKEY#,
                #rhythmicContext.RYTHMKEY#,
                #rhythmicContext.RPREPARATION#,
                #rhythmicContext.REARLY#,
                #rhythmicContext.RMIDDLE#,
                #rhythmicContext.RLATE#
                )
                select @@identity
        </cfquery>
         <cfset arrGirls = QueryToStruct(insert)/>
         <cfset objectWrapper = structNew()>
         <cfset objectWrapper.results = #arrGirls#>
         <cfreturn objectWrapper> 
    </cffunction>

    <cffunction name="updateMelodicContext" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="MelodicContext" type="any" required="yes">
        <cfset MelodicContext = DeserializeJSON(MelodicContext)>
        <cfset MelodicContext.MPREPARATION = checkForTrue(MelodicContext.MPREPARATION)>
        <cfset MelodicContext.MEARLYPRACTICE = checkForTrue(MelodicContext.MEARLYPRACTICE)>
        <cfset MelodicContext.MMIDDLEPRACTICE = checkForTrue(MelodicContext.MMIDDLEPRACTICE)>
        <cfset MelodicContext.MLATEPRACTICE = checkForTrue(MelodicContext.MLATEPRACTICE)>
        <cfquery name="update" datasource="kodaly_4" > 
        update dbo.[tbl Title Melodic Element]
        set [Melodic Element Key] = #MelodicContext.MELODICELEMENTKEY#,
        [Melodic Element context]= '#MelodicContext.CONTEXTNAME#',
        MPreparation =#MelodicContext.MPREPARATION#,
        [MEarly Practice] = #MelodicContext.MPREPARATION# ,
        [MMiddle Practice] = #MelodicContext.MMIDDLEPRACTICE# ,
        [MLate Practice] = #MelodicContext.MLATEPRACTICE#, 
        MelodicContextKey = #MelodicContext.MELODICCONTEXTKEY#
        where id = #MelodicContext.ID#
        select 1
        </cfquery>
     <cfset arrGirls = QueryToStruct(update)/>
     <cfset objectWrapper = structNew()>
     <cfset objectWrapper.results = #arrGirls#>
     <cfreturn objectWrapper> 
    </cffunction>   


    <cffunction name="insertMelodicContext" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="MelodicContext" type="any" required="yes">
        <cfset MelodicContext = DeserializeJSON(MelodicContext)>
        <cfset MelodicContext.MPREPARATION = checkForTrue(MelodicContext.MPREPARATION)>
        <cfset MelodicContext.MEARLYPRACTICE = checkForTrue(MelodicContext.MEARLYPRACTICE)>
        <cfset MelodicContext.MMIDDLEPRACTICE = checkForTrue(MelodicContext.MMIDDLEPRACTICE)>
        <cfset MelodicContext.MLATEPRACTICE = checkForTrue(MelodicContext.MLATEPRACTICE)>
        <cfquery name="insert" datasource="kodaly_4">
        INSERT INTO dbo.[tbl Title Melodic Element]
            ( [Title Key] ,
              [Melodic Element Key] ,
               [Melodic Element context],
              MPreparation ,
              [MEarly Practice] ,
              [MMiddle Practice] ,
              [MLate Practice],
              MelodicContextKey
            )
    VALUES  ( #MelodicContext.TITLE_KEY# ,
              #MelodicContext.MELODICELEMENTKEY.DATA#, 
    
              '#MelodicContext.MELODICELEMENTKEY.LABEL#' , 
              
             #MelodicContext.MPREPARATION# , 
              #MelodicContext.MEARLYPRACTICE# ,
              #MelodicContext.MMIDDLEPRACTICE# ,
             #MelodicContext.MLATEPRACTICE#,  
              #MelodicContext.MELODICCONTEXTKEY#
            )
            select @@identity
        </cfquery>
        <cfset arrGirls = QueryToStruct(insert)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper> 
        </cffunction>


    <cffunction name="getMelodicContectRecord" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="melContextRecord" type="any" required="true" >
            <cfquery  name="contextRecord" datasource="kodaly_4">
                    SELECT     [tbl Title Melodic Element].id, [tbl Title Melodic Element].[Title Key] AS titleKey, [tbl Title Melodic Element].[Melodic Element Key] AS melodicElementKey, 
                          [tbl Title Melodic Element].[Melodic Element context] AS melodicElementContext, [tbl Title Melodic Element].MPreparation, 
                          [tbl Title Melodic Element].[MEarly Practice] AS MearlyPractice, [tbl Title Melodic Element].[MMiddle Practice] AS MMiddlePractice, 
                          [tbl Title Melodic Element].[MLate Practice] AS MlatePractice, [tbl Melodic Elements].[Tone Abbreviation] AS toneAbbreviation, 
                          [tbl Title Melodic Element].MelodicContextKey, [tbl Melodic Elements].[Tone Name] AS toneName, tbl_NewMelodicContexts.contextName
                from [tbl Title Melodic Element]
                inner join [tbl Melodic Elements] on [tbl Melodic Elements].[Melodic Element Key] = [tbl Title Melodic Element].[Melodic Element Key]
                left outer join tbl_NewMelodicContexts on [tbl Title Melodic Element].MelodicContextKey = tbl_NewMelodicContexts.ID
                where [tbl Title Melodic Element].id=#melContextRecord#
            </cfquery>
         <cfset arrGirls = QueryToStruct(contextRecord)/>
         <cfset objectWrapper = structNew()>
         <cfset objectWrapper.results = #arrGirls#>
         <cfreturn objectWrapper> 

    </cffunction>



    <cffunction name="getMelodicContextsForSong" access="remote" returntype="Any" returnformat="JSON">
        <cfargument name="titleKey" type="numeric" required="true">
        <cfquery name="melodicContexts" datasource="kodaly_4">
    SELECT     [tbl Title Melodic Element].id, [tbl Title Melodic Element].[Title Key] AS titleKey, [tbl Title Melodic Element].[Melodic Element Key] AS melodicElementKey, 
                          [tbl Title Melodic Element].[Melodic Element context] AS melodicElementContext, [tbl Title Melodic Element].MPreparation, 
                          [tbl Title Melodic Element].[MEarly Practice] AS MearlyPractice, [tbl Title Melodic Element].[MMiddle Practice] AS MMiddlePractice, 
                          [tbl Title Melodic Element].[MLate Practice] AS MlatePractice, [tbl Melodic Elements].[Tone Abbreviation] AS toneAbbreviation, 
                          [tbl Title Melodic Element].MelodicContextKey, [tbl Melodic Elements].[Tone Name] AS toneName, tbl_NewMelodicContexts.contextName
    FROM         [tbl Title Melodic Element] INNER JOIN
                          [tbl Melodic Elements] ON [tbl Title Melodic Element].[Melodic Element Key] = [tbl Melodic Elements].[Melodic Element Key] LEFT OUTER JOIN
                          tbl_NewMelodicContexts ON [tbl Title Melodic Element].MelodicContextKey = tbl_NewMelodicContexts.ID
    WHERE     ([tbl Title Melodic Element].[Title Key] = #titleKey#)
         </cfquery>
        <cfset arrGirls = QueryToStruct(melodicContexts)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper> 
    </cffunction>

    <cffunction name="getMelContextsForElement" access="remote" returntype="Any" returnformat="JSON">
        <cfargument name="element" type="numeric" required="true" >
            <cfquery name="contexts" datasource="kodaly_4">
                    SELECT     contextName as label,ID as data
                    FROM         tbl_NewMelodicContexts
                    WHERE     (melodicElementKey = #element#)
                    ORDER BY elementSortIndex
            </cfquery>
            <cfset arrGirls = QueryToStruct(contexts)/>
            <cfset objectWrapper = structNew()>
            <cfset objectWrapper.results = #arrGirls#>
            <cfreturn objectWrapper> 
    </cffunction>

    <cffunction name="getMelodicElements" access="remote" returntype="any" returnformat="JSON">
        <cfquery name="elements" datasource="kodaly_4">
            SELECT [Melodic Element Key] AS data
                ,[Tone Abbreviation] AS label
            FROM [tbl Melodic Elements]
            where [Tone Abbreviation] <> '_None'
            ORDER BY [Tone Sequence Number]
    </cfquery>
         <cfset arrGirls = QueryToStruct(elements)/>
         <cfset objectWrapper = structNew()>
         <cfset objectWrapper.results = #arrGirls#>
         <cfreturn objectWrapper> 
        </cffunction>

    <cffunction name="getMeters" access="remote" returntype="any" returnformat="JSON">
        <cfquery name="meters" datasource="kodaly_4">
    SELECT      [tbl Meters].[Meter Key] AS data, [tbl Meters].Meter AS label
    FROM          [tbl Meters]
    order by [Meter Sequence Number]
        </cfquery>
       <cfset arrGirls = QueryToStruct(meters)/>
       <cfset objectWrapper = structNew()>
       <cfset objectWrapper.results = #arrGirls#>
       <cfreturn objectWrapper> 
        </cffunction>


        <cffunction name="getForms" access="remote" returntype="any" returnformat="JSON">
            <cfquery name="forms" datasource="kodaly_4">
        SELECT      [tbl Forms].[Form Key] AS data, [tbl Forms].[Form Name] AS label
        FROM          [tbl Forms]
        ORDER BY [tbl Forms].[Form Sequence Number] 
        </cfquery>
            <cfset arrGirls = QueryToStruct(forms)/>
            <cfset objectWrapper = structNew()>
            <cfset objectWrapper.results = #arrGirls#>
            <cfreturn objectWrapper> 
            </cffunction>


    <cffunction name="getFormTypes" access="remote" returntype="any" returnformat="JSON">
        <cfquery name="formType" datasource="kodaly_4">
    SELECT      [tbl_Form_Type].[Form_Type_Key] AS data, [tbl_Form_Type].[Form_Type] AS label
    FROM          [tbl_Form_Type]
    ORDER BY Form_Type
    </cfquery>
         <cfset arrGirls = QueryToStruct(formType)/>
         <cfset objectWrapper = structNew()>
         <cfset objectWrapper.results = #arrGirls#>
         <cfreturn objectWrapper> 
        </cffunction>

    <cffunction name="getStartingPitch" access="remote" returntype="any" returnformat="JSON">
            <cfquery name="startingPitch" datasource="kodaly_4">
                SELECT      Starting_Pitch_Table.Starting_Pitch_ID AS data, Starting_Pitch_Table.Starting_Pitch AS label
                FROM          Starting_Pitch_Table
                ORDER BY sequence
            </cfquery>
        <cfset arrGirls = QueryToStruct(startingPitch)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper> 
    </cffunction>

    <cffunction name="getScales" access="remote" returntype="any"  returnformat="JSON">
        <cfquery name="scales" datasource="kodaly_4">
            SELECT [Scale Key] AS data, Scale AS label 
            FROM dbo.[tbl Scales]
            ORDER BY Scale
        </cfquery>
        <cfset arrGirls = QueryToStruct(scales)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper> 
        </cffunction>

    <cffunction name="getRange" access="remote" returntype="any" returnformat="JSON">
        <cfquery name="range" datasource="kodaly_4">
            SELECT Range_ID AS data, Range AS label
            FROM dbo.Table_Range
            ORDER BY Sort_Order ASC
        </cfquery>
        <cfset arrGirls = QueryToStruct(range)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper> 
        </cffunction>

    <cffunction name="getSongDetails" access="remote" returntype="any" returnformat="JSON">
        <cfargument name="songID" type="numeric" required="yes">
        <cfquery name="songDetails" datasource="kodaly_4">
       SELECT *
            FROM [tbl_Titles]
            WHERE ID = #songID#
        </cfquery>  
       <cfset arrGirls = QueryToStruct(songDetails)/>
       <cfset objectWrapper = structNew()>
       <cfset objectWrapper.results = #arrGirls#>
       <cfreturn objectWrapper> 
        </cffunction>

        <cffunction name="getNotes" access="remote" returntype="any" returnformat="JSON">
            <cfquery name="notes" datasource="kodaly_4">
                SELECT Note_ID AS data , Note AS label
                FROM dbo.Note_Table
                ORDER BY Note_ID
            </cfquery>
            <cfset arrGirls = QueryToStruct(notes)/>
            <cfset objectWrapper = structNew()>
            <cfset objectWrapper.results = #arrGirls#>
            <cfreturn objectWrapper> 
            </cffunction>

        <cffunction name="getEthnicities" access="remote" returntype="any" returnformat="JSON">
            <cfquery name="ethicy" datasource="kodaly_4">
            SELECT Ethnicity_ID AS data, Ethnicity AS label
            FROM dbo.Ethnicity_Table
            ORDER BY Ethnicity
            </cfquery>
           <cfset arrGirls = QueryToStruct(ethicy)/>
           <cfset objectWrapper = structNew()>
           <cfset objectWrapper.results = #arrGirls#>
           <cfreturn objectWrapper> 
            </cffunction>

        <cffunction name="getRegions" access="remote" returntype="any" returnformat="JSON">
            <cfquery name="regions" datasource="kodaly_4">
            SELECT Region_ID AS data, Region AS label
        FROM dbo.Region_Table
        ORDER BY Region
            </cfquery>
           <cfset arrGirls = QueryToStruct(regions)/>
           <cfset objectWrapper = structNew()>
           <cfset objectWrapper.results = #arrGirls#>
           <cfreturn objectWrapper> 
            </cffunction>

        <cffunction name="getStates" access="remote" returntype="any" returnformat="JSON">
            <cfquery name="states" datasource="kodaly_4">
                SELECT  State AS label, State_ID AS data
                FROM dbo.State_Table
                ORDER BY State
            </cfquery>
            <cfset arrGirls = QueryToStruct(states)/>
            <cfset objectWrapper = structNew()>
            <cfset objectWrapper.results = #arrGirls#>
            <cfreturn objectWrapper> 
        </cffunction>

    <cffunction name="getSongs" access="remote" returntype="any" returnformat="JSON">
        <cfquery name="queryName" datasource="kodaly_4">
select ID, Title, Alt_Title_1, First_Line_Text,Notation_File_Name, Recording_Flag from tbl_Titles
order by Title
        </cfquery>
        <cfset arrGirls = QueryToStruct(queryName)/>
        <cfset objectWrapper = structNew()>
        <cfset objectWrapper.results = #arrGirls#>
        <cfreturn objectWrapper>
    </cffunction>


    <cffunction name="checkSecure" access="remote" returntype="Any" returnformat="JSON">
        <cfargument name="email" type="any">
        <cfargument name="pword" type="any">
        <cfquery name="queryName" datasource="kodaly_4">
            select email
            from tbl_secure
            where pword = '#pword#' and email = '#email#'
        </cfquery>
       <cfset arrGirls = QueryToStruct(queryName)/>
       <cfset objectWrapper = structNew()>
       <cfset objectWrapper.results = #arrGirls#>
       <cfreturn objectWrapper>
    </cffunction>

    <cffunction name="logInUser" access="remote" returntype="Any" returnformat="JSON">
        <cfargument name="user" type="any">
        <cfquery name="queryName" datasource="kodaly_4">
            insert into tbl_UserLogs
            (userEmail)
 
            values(
            '#user#'
 
        )
        </cfquery>
        <cfreturn 1>
    </cffunction>
    
    
	
	
	
	

    
    
    <cffunction name="getTitles" access="remote" returntype="any">
		<cfquery datasource="kodaly_4" name="titles">
        	SELECT  ID,
              Title,
              First_Line_Text,
              Analyzed
  FROM [tbl_Titles]
  ORDER BY Title
        </cfquery>
		<cfreturn titles>
	</cffunction>
    
    
       
        
        
        
     <cffunction name="getTitlesForCBO" access="remote" returntype="any">
		<cfquery datasource="kodaly_4" name="titles">
        	SELECT  ID as data,
              Title as label
  FROM [tbl_Titles]
  ORDER BY Title
        </cfquery>
		<cfreturn titles>
	</cffunction>

	

	
    
    
    
    
    
    
     
     <cffunction name="insertMotiveToSong" access="remote" returntype="Any">
         <cfargument name="motive" type="any" required="true">
         <cfquery name="newMotive" datasource="kodaly_4">
             INSERT INTO dbo.tbl_Title_Motive
        ( title_ID, motive )
VALUES  ( #motive.title_ID#, -- title_ID - int
          '#motive.motive#'  -- motive - nvarchar(50)
          )
          SELECT 1
         </cfquery>
         
        <cfreturn  newMotive>
         
     </cffunction>
     
      <cffunction name="deleteMotiveForSong" access="remote" returntype="Any">
         <cfargument name="motive" type="any" required="true">
         <cfquery name="newMotive" datasource="kodaly_4">
             DELETE FROM dbo.tbl_Title_Motive
WHERE motive = '#motive.motive#'  AND title_ID = #motive.title_ID#
          SELECT 1
         </cfquery>
         
        <cfreturn  newMotive>
         
     </cffunction>
     
     
     
     
     
    
     
    
    


     
    
     
    
     
    
     
    

    <cffunction name="getMelodicContexts" access="remote" returntype="any">
    <cfquery name="elements" datasource="kodaly_4">
SELECT     id AS data, [melodic Context] AS label
FROM         tbl_MelodicContext

</cfquery>
    <cfreturn elements>
    </cffunction>
    
   



<cffunction name="deleteMelodicContextForSong" access="remote" returntype="any">
<cfargument name="id" type="numeric" required="yes">
<cfquery name="deleteMelodicContextRecord" datasource="kodaly_4">
DELETE FROM dbo.[tbl Title Melodic Element]
WHERE  id =#id#
select 1
</cfquery>
<cfreturn deleteMelodicContextRecord>
</cffunction>

<cffunction name="deleteRythmicContextForSong" access="remote" returntype="any">
<cfargument name="id" type="numeric" required="yes">
<cfquery name="deleteRythmicContextRecord" datasource="kodaly_4">
DELETE FROM dbo.[tbl Title Rhythmic Element]
WHERE id = #id#
select 1
</cfquery>
</cffunction>



   

	

	<cffunction name="insertRythmicContext" access="remote" returntype="any">
    <cfargument name="rythmicContext" required="yes" type="any">
    
	<cfif rythmicContext.rLate EQ "true">
	<cfset rythmicContext.rLate = 1>
    <cfelse>
    <cfset rythmicContext.rLate = 0>
    </cfif>
    
    <cfif rythmicContext.rEarly EQ "true">
	<cfset rythmicContext.rEarly = 1>
    <cfelse>
    <cfset rythmicContext.rEarly = 0>
    </cfif>
    
    <cfif rythmicContext.rMiddle EQ "true">
	<cfset rythmicContext.rMiddle = 1>
    <cfelse>
    <cfset rythmicContext.rMiddle = 0>
    </cfif>
    
    <cfif rythmicContext.RPreparation EQ "true">
	<cfset rythmicContext.RPreparation = 1>
    <cfelse>
    <cfset rythmicContext.RPreparation = 0>
    </cfif>
    
    
    
    <cfquery name="newContext" datasource="kodaly_4">
    INSERT INTO dbo.[tbl Title Rhythmic Element]
        ( [Title Key] ,
          [Rhythmic Element Key] ,
        
          RPreparation ,
          [REarly Practice] ,
          [RMiddle Practice] ,
          [RLate Practice]
        
        )
VALUES  ( #rythmicContext.titleKey#, -- Title Key - int
          #rythmicContext.rhythmKey# , -- Rhythmic Element Key - int
          #rythmicContext.RPreparation# , -- RPreparation - bit
          #rythmicContext.rEarly# , -- REarly Practice - bit
         #rythmicContext.rMiddle#  , -- RMiddle Practice - bit
          #rythmicContext.rLate#  -- RLate Practice - bit
		
        )
        select @@identity
    </cfquery>
    <cfreturn newContext>
    </cffunction>


	
   













<cffunction name="insertNewSong" access="remote" returntype="any">
<cfargument name="SongDetails" type="any" required="yes">

<cfif #SongDetails.Analyzed# eq "true">
<cfset SongDetails.Analyzed = 1>
<cfelse>
<cfset SongDetails.Analyzed = 0>
</cfif>
<cfif #SongDetails.inFinale# eq "true">
<cfset SongDetails.inFinale = 1>
<cfelse>
<cfset SongDetails.inFinale = 0>
</cfif>
<cfif #SongDetails.Proofed_Flag# eq "true">
<cfset SongDetails.Proofed_Flag = 1>
<cfelse>
<cfset SongDetails.Proofed_Flag = 0>
</cfif>
<cfif #SongDetails.IP_Status# eq "true">
<cfset SongDetails.IP_Status = 1>
<cfelse>
<cfset SongDetails.IP_Status = 0>
</cfif>
<cfif #SongDetails.LoC# eq "true">
<cfset SongDetails.LoC = 1>
<cfelse>
<cfset SongDetails.LoC = 0>
</cfif>
<cfif #SongDetails.Child# eq "true">
<cfset SongDetails.Child = 1>
<cfelse>
<cfset SongDetails.Child = 0>
</cfif>



<cfquery datasource="kodaly_4" name="newID">
INSERT INTO dbo.tbl_Titles
        ( Title ,
          Alt_Title_1 ,
          Alt_Title_2 ,
          First_Line_Text ,
          Informant ,
          scaleID ,
          NOTE ,
          tonalCenterID ,
          meterID ,
          formID ,
          stateID ,
          regionID ,
          rangeID ,
          toneSetID ,
          formAnalysisStr ,
          Analyzed ,
          [Proofed_Flag] ,
          inFinale ,
          IP_Status,
          LoC,
          Child, 
          Comments, 
          Publication,
          Song_Background  
          
        )
VALUES  ( '#SongDetails.Title#' , -- Title - nvarchar(255)
           '#SongDetails.Alt_Title_1#'  , -- Alt_Title_1 - nvarchar(50)
          '#SongDetails.Alt_Title_2#'  , -- Alt_Title_2 - nvarchar(50)
          '#SongDetails.First_Line_Text#'  , -- First_Line_Text - nvarchar(250)
          '#SongDetails.Informant#' , -- Informant - nvarchar(250)
           #SongDetails.scaleID#, -- scaleID - int
         #SongDetails.NOTE#, -- NOTE - int
          #SongDetails.tonalCenterID# , -- tonalCenterID - int
          #SongDetails.meterID# , -- meterID - int
          #SongDetails.formID# , -- formID - int
          #SongDetails.stateID# , -- stateID - int
          #SongDetails.regionID#  , -- regionID - int
          #SongDetails.rangeID#, -- rangeID - int
         '#SongDetails.toneSetID#'  , -- toneSetID - nvarchar(50)
          '#SongDetails.formAnalysisStr#'  , -- formAnalysisStr - nvarchar(50)
         
          #SongDetails.Analyzed# , -- Analyzed - bit
          #SongDetails.Proofed_Flag# , -- [Proofed_Flag] - bit
          #SongDetails.inFinale# , -- inFinale - bit
          #SongDetails.IP_Status# ,
           #SongDetails.LoC#,
         #SongDetails.Child#, -- Child - bit
         '#SongDetails.Comments#',
         '#SongDetails.Publication#',
         '#SongDetails.Song_Background#'
         
        
        )
        SELECT @@IDENTITY as newID
</cfquery>
<cfreturn newID>
</cffunction>

<cffunction name="updateSong" access="remote" returntype="any">
<cfargument name="SongDetails" type="any">

<!--- boolean sections --->
<cfif #SongDetails.Analyzed# eq "true">
<cfset SongDetails.Analyzed = 1>
<cfelse>
<cfset SongDetails.Analyzed = 0>
</cfif>
<cfif #SongDetails.inFinale# eq "true">
<cfset SongDetails.inFinale = 1>
<cfelse>
<cfset SongDetails.inFinale = 0>
</cfif>
<cfif #SongDetails.Proofed_Flag# eq "true">
<cfset SongDetails.Proofed_Flag = 1>
<cfelse>
<cfset SongDetails.Proofed_Flag = 0>
</cfif>
<cfif #SongDetails.IP_Status# eq "true">
<cfset SongDetails.IP_Status = 1>
<cfelse>
<cfset SongDetails.IP_Status = 0>
</cfif>
<cfif #SongDetails.LoC# eq "true">
<cfset SongDetails.LoC = 1>
<cfelse>
<cfset SongDetails.LoC = 0>
</cfif>
<cfif #SongDetails.Child# eq "true">
<cfset SongDetails.Child = 1>
<cfelse>
<cfset SongDetails.Child = 0>
</cfif>

<cfif #SongDetails.one# eq "true">
<cfset SongDetails.one = 1>
<cfelse>
<cfset SongDetails.one = 0>
</cfif>

<cfif #SongDetails.two# eq "true">
<cfset SongDetails.two = 1>
<cfelse>
<cfset SongDetails.two = 0>
</cfif>

<cfif #SongDetails.three# eq "true">
<cfset SongDetails.three = 1>
<cfelse>
<cfset SongDetails.three = 0>
</cfif>

<cfif #SongDetails.four# eq "true">
<cfset SongDetails.four = 1>
<cfelse>
<cfset SongDetails.four = 0>
</cfif>

<cfif #SongDetails.five# eq "true">
<cfset SongDetails.five = 1>
<cfelse>
<cfset SongDetails.five = 0>
</cfif>

<cfif #SongDetails.six# eq "true">
<cfset SongDetails.six = 1>
<cfelse>
<cfset SongDetails.six = 0>
</cfif>

<cfif #SongDetails.seven# eq "true">
<cfset SongDetails.seven = 1>
<cfelse>
<cfset SongDetails.seven = 0>
</cfif>

<cfif #SongDetails.eight# eq "true">
<cfset SongDetails.eight = 1>
<cfelse>
<cfset SongDetails.eight = 0>
</cfif>

<cfif #SongDetails.nine# eq "true">
<cfset SongDetails.nine = 1>
<cfelse>
<cfset SongDetails.nine = 0>
</cfif>

<cfif #SongDetails.ten# eq "true">
<cfset SongDetails.ten = 1>
<cfelse>
<cfset SongDetails.ten = 0>
</cfif>


<cfif #SongDetails.k# eq "true">
<cfset SongDetails.k = 1>
<cfelse>
<cfset SongDetails.k = 0>
</cfif>

<cfif #SongDetails.zero# eq "true">
<cfset SongDetails.zero= 1>
<cfelse>
<cfset SongDetails.zero = 0>
</cfif>

<cfif #SongDetails.ch# eq "true">
<cfset SongDetails.ch= 1>
<cfelse>
<cfset SongDetails.ch = 0>
</cfif>

<cfif #SongDetails.ta# eq "true">
<cfset SongDetails.ta= 1>
<cfelse>
<cfset SongDetails.ta = 0>
</cfif>

<cfif #SongDetails.ti_ti# eq "true">
<cfset SongDetails.ti_ti= 1>
<cfelse>
<cfset SongDetails.ti_ti = 0>
</cfif>

<cfif #SongDetails.rest# eq "true">
<cfset SongDetails.rest= 1>
<cfelse>
<cfset SongDetails.rest = 0>
</cfif>

<cfif #SongDetails.ta_a# eq "true">
<cfset SongDetails.ta_a= 1>
<cfelse>
<cfset SongDetails.ta_a = 0>
</cfif>

<cfif #SongDetails.half_rest# eq "true">
<cfset SongDetails.half_rest= 1>
<cfelse>
<cfset SongDetails.half_rest = 0>
</cfif>

<cfif #SongDetails.ta_a_a# eq "true">
<cfset SongDetails.ta_a_a= 1>
<cfelse>
<cfset SongDetails.ta_a_a = 0>
</cfif>

<cfif #SongDetails.ta_a_a_a# eq "true">
<cfset SongDetails.ta_a_a_a= 1>
<cfelse>
<cfset SongDetails.ta_a_a_a = 0>
</cfif>

<cfif #SongDetails.whole_rest# eq "true">
<cfset SongDetails.whole_rest= 1>
<cfelse>
<cfset SongDetails.whole_rest = 0>
</cfif>

<cfif #SongDetails.tiri_tiri# eq "true">
<cfset SongDetails.tiri_tiri= 1>
<cfelse>
<cfset SongDetails.tiri_tiri = 0>
</cfif>

<cfif #SongDetails.ti_tiri# eq "true">
<cfset SongDetails.ti_tiri= 1>
<cfelse>
<cfset SongDetails.ti_tiri = 0>
</cfif>

<cfif #SongDetails.tiri_ti# eq "true">
<cfset SongDetails.tiri_ti= 1>
<cfelse>
<cfset SongDetails.tiri_ti = 0>
</cfif>

<cfif #SongDetails.ti_ta_ti# eq "true">
<cfset SongDetails.ti_ta_ti= 1>
<cfelse>
<cfset SongDetails.ti_ta_ti = 0>
</cfif>

<cfif #SongDetails.tai_ti# eq "true">
<cfset SongDetails.tai_ti= 1>
<cfelse>
<cfset SongDetails.tai_ti = 0>
</cfif>

<cfif #SongDetails.ti_tai# eq "true">
<cfset SongDetails.ti_tai= 1>
<cfelse>
<cfset SongDetails.ti_tai = 0>
</cfif>

<cfif #SongDetails.eighth_rest# eq "true">
<cfset SongDetails.eighth_rest= 1>
<cfelse>
<cfset SongDetails.eighth_rest = 0>
</cfif>

<cfif #SongDetails.ti# eq "true">
<cfset SongDetails.ti= 1>
<cfelse>
<cfset SongDetails.ti = 0>
</cfif>

<cfif #SongDetails.tiri# eq "true">
<cfset SongDetails.tiri= 1>
<cfelse>
<cfset SongDetails.tiri = 0>
</cfif>

<cfif #SongDetails.tim_ri# eq "true">
<cfset SongDetails.tim_ri= 1>
<cfelse>
<cfset SongDetails.tim_ri = 0>
</cfif>

<cfif #SongDetails.ri_tim# eq "true">
<cfset SongDetails.ri_tim= 1>
<cfelse>
<cfset SongDetails.ri_tim = 0>
</cfif>

<cfif #SongDetails.tri_o_la# eq "true">
<cfset SongDetails.tri_o_la= 1>
<cfelse>
<cfset SongDetails.tri_o_la = 0>
</cfif>

<cfif #SongDetails.ti_ti_ti# eq "true">
<cfset SongDetails.ti_ti_ti= 1>
<cfelse>
<cfset SongDetails.ti_ti_ti = 0>
</cfif>

<cfif #SongDetails.ta_ti# eq "true">
<cfset SongDetails.ta_ti= 1>
<cfelse>
<cfset SongDetails.ta_ti = 0>
</cfif>

<cfif #SongDetails.ti_ta# eq "true">
<cfset SongDetails.ti_ta= 1>
<cfelse>
<cfset SongDetails.ti_ta = 0>
</cfif>

<cfif #SongDetails.tai# eq "true">
<cfset SongDetails.tai= 1>
<cfelse>
<cfset SongDetails.tai = 0>
</cfif>

<cfif #SongDetails.tim_ri_ti# eq "true">
<cfset SongDetails.tim_ri_ti= 1>
<cfelse>
<cfset SongDetails.tim_ri_ti = 0>
</cfif>

<cfif #SongDetails.ri_tim_ti# eq "true">
<cfset SongDetails.ri_tim_ti= 1>
<cfelse>
<cfset SongDetails.ri_tim_ti = 0>
</cfif>

<cfif #SongDetails.ti_tim_ri# eq "true">
<cfset SongDetails.ti_tim_ri= 1>
<cfelse>
<cfset SongDetails.ti_tim_ri = 0>
</cfif>

<cfif #SongDetails.tika_tika_tika# eq "true">
<cfset SongDetails.tika_tika_tika= 1>
<cfelse>
<cfset SongDetails.tika_tika_tika = 0>
</cfif>

<cfif #SongDetails.tie# eq "true">
<cfset SongDetails.tie= 1>
<cfelse>
<cfset SongDetails.tie = 0>
</cfif>

<cfif #SongDetails.other_other# eq "true">
<cfset SongDetails.other_other= 1>
<cfelse>
<cfset SongDetails.other_other = 0>
</cfif>



<cfif #SongDetails.Anac# eq "true">
<cfset SongDetails.Anac= 1>
<cfelse>
<cfset SongDetails.Anac = 0>
</cfif>

<cfif #SongDetails.Ri# eq "true">
<cfset SongDetails.Ri= 1>
<cfelse>
<cfset SongDetails.Ri = 0>
</cfif>

<cfif #SongDetails.Tim# eq "true">
<cfset SongDetails.Tim= 1>
<cfelse>
<cfset SongDetails.Tim = 0>
</cfif>

<cfif #SongDetails.ri_tim_ri# eq "true">
<cfset SongDetails.ri_tim_ri= 1>
<cfelse>
<cfset SongDetails.ri_tim_ri = 0>
</cfif>

<cfif #SongDetails.IP_Status# eq "true">
<cfset SongDetails.IP_Status= 1>
<cfelse>
<cfset SongDetails.IP_Status = 0>
</cfif>
    
<cfif #SongDetails.Recording_Flag# eq 'true'>
<cfset SongDetails.Recording_Flag = 1>    
<cfelse>  
 <cfset SongDetails.Recording_Flag = 0>    
</cfif> 

<cfif #SongDetails.Game# eq 'true'>
<cfset SongDetails.Game = 1>    
<cfelse>  
 <cfset SongDetails.Game = 0>    
</cfif> 
   

<cfquery name="editSong" datasource="kodaly_4">
 			update tbl_Titles
            set
            Title = '#SongDetails.Title#' ,
          Alt_Title_1 = '#SongDetails.Alt_Title_1#' ,
          Alt_Title_2 =  '#SongDetails.Alt_Title_2#'  ,
          First_Line_Text = '#SongDetails.First_Line_Text#' ,
          Informant = '#SongDetails.Informant#',
          scaleID =  #SongDetails.scaleID# ,
          NOTE = #SongDetails.NOTE# ,
          tonalCenterID = #SongDetails.tonalCenterID#  ,
          meterID = #SongDetails.meterID# ,
          formID = #SongDetails.formID#  ,


          stateID = #SongDetails.stateID# ,
           

          rangeID = #SongDetails.rangeID# ,
          toneSetID = '#SongDetails.toneSetID#' ,

          formAnalysisStr = '#SongDetails.formAnalysisStr#' ,
          Analyzed =  #SongDetails.Analyzed# ,

          inFinale = #SongDetails.inFinale#  ,
          Starting_PitchID = #SongDetails.Starting_PitchID# ,
          ethnicityID =  #SongDetails.ethnicityID# ,
          Publication = '#SongDetails.Publication#' ,
          Comments = '#SongDetails.Comments#' ,
          formTypeID = #SongDetails.formTypeID# ,

          Notation_File_Name = '#SongDetails.Notation_File_Name#' ,

          one = #SongDetails.one# ,
          two = #SongDetails.two# ,
          three = #SongDetails.three# ,
          four =  #SongDetails.four# ,
          five =  #SongDetails.five# ,
          six =  #SongDetails.six#,
          seven =   #SongDetails.seven# ,
          eight =   #SongDetails.eight# ,
          nine =  #SongDetails.nine#,
          ten = #SongDetails.ten# ,
        
          k =  #SongDetails.k# ,
          zero =  #SongDetails.zero#,
          ch =  #SongDetails.ch# ,
          ta = #SongDetails.ta# ,
          ti_ti =   #SongDetails.ti_ti#,
          rest =  #SongDetails.rest# ,
          ta_a = #SongDetails.ta_a#  ,
          half_rest = #SongDetails.half_rest#   ,
          ta_a_a = #SongDetails.ta_a_a#,
          ta_a_a_a = #SongDetails.ta_a_a_a# ,
          whole_rest = #SongDetails.whole_rest# ,
          tiri_tiri = #SongDetails.tiri_tiri#  ,
          ti_tiri = #SongDetails.ti_tiri# ,
          tiri_ti = #SongDetails.tiri_ti#,
          ti_ta_ti = #SongDetails.ti_ta_ti# ,
          tai_ti = #SongDetails.tai_ti#,
          ti_tai = #SongDetails.ti_tai# ,
          eighth_rest = #SongDetails.eighth_rest#  ,
          ti = #SongDetails.ti#  ,
          tiri = #SongDetails.tiri#  ,
          tim_ri = #SongDetails.tim_ri# ,
          ri_tim = #SongDetails.ri_tim# ,
          tri_o_la = #SongDetails.tri_o_la#  ,
          ti_ti_ti = #SongDetails.ti_ti_ti# ,
          ta_ti = #SongDetails.ta_ti#  ,
          ti_ta = #SongDetails.ti_ta# ,
          tai = #SongDetails.tai#,
          tim_ri_ti = #SongDetails.tim_ri_ti# ,
          ri_tim_ti = #SongDetails.ri_tim_ti#  ,
          ti_tim_ri = #SongDetails.ti_tim_ri# ,
          tie = #SongDetails.tie# ,
          other_other = #SongDetails.other_other#  ,
          Anac = #SongDetails.Anac#  ,
          Ri = #SongDetails.Ri# ,
          Tim = #SongDetails.Tim#  ,
          ri_tim_ri = #SongDetails.ri_tim_ri# ,
          IP_Status = #SongDetails.IP_Status#  ,
          Proofed_Flag = #SongDetails.Proofed_Flag# ,
          LoC = #SongDetails.LoC# ,
          Child = #SongDetails.Child#,
          Grade_String =  '#SongDetails.Grade_String#',
          Song_Background = '#SongDetails.Song_Background#',
            Recording_Flag = #SongDetails.Recording_Flag#,
            Game = #SongDetails.Game#
          where ID = #SongDetails.ID#
          select 1
</cfquery>
<cfreturn editSong>
</cffunction>

<cffunction name="deleteSong" access="remote" returntype="any">
<cfargument name="ID" type="numeric" required="yes">
<cfquery name="delete" datasource="kodaly_4">
delete from tbl_Titles where id = #ID#
select 1
</cfquery>
<cfreturn delete>
</cffunction>

<cffunction name="QueryToStruct" access="public" returntype="any" output="false"
hint="Converts an entire query or the given record to a struct. This might return a structure (single record) or an array of structures.">

<!--- Define arguments. --->
<cfargument name="Query" type="query" required="true"/>
<cfargument name="Row" type="numeric" required="false" default="0"/>

<cfscript>

// Define the local scope.
var LOCAL = StructNew();

// Determine the indexes that we will need to loop over.
// To do so, check to see if we are working with a given row,
// or the whole record set.
if (ARGUMENTS.Row) {

// We are only looping over one row.
    LOCAL.FromIndex = ARGUMENTS.Row;
    LOCAL.ToIndex = ARGUMENTS.Row;

} else {

// We are looping over the entire query.
    LOCAL.FromIndex = 1;
    LOCAL.ToIndex = ARGUMENTS.Query.RecordCount;

}

// Get the list of columns as an array and the column count.
LOCAL.Columns = ListToArray(ARGUMENTS.Query.ColumnList);
LOCAL.ColumnCount = ArrayLen(LOCAL.Columns);

// Create an array to keep all the objects.
LOCAL.DataArray = ArrayNew(1);

// Loop over the rows to create a structure for each row.
for (LOCAL.RowIndex = LOCAL.FromIndex; LOCAL.RowIndex LTE LOCAL.ToIndex; LOCAL.RowIndex = (LOCAL.RowIndex + 1)) {

// Create a new structure for this row.
    ArrayAppend(LOCAL.DataArray, StructNew());

// Get the index of the current data array object.
    LOCAL.DataArrayIndex = ArrayLen(LOCAL.DataArray);

// Loop over the columns to set the structure values.
    for (LOCAL.ColumnIndex = 1; LOCAL.ColumnIndex LTE LOCAL.ColumnCount; LOCAL.ColumnIndex = (LOCAL.ColumnIndex + 1)) {

// Get the column value.
        LOCAL.ColumnName = LOCAL.Columns[ LOCAL.ColumnIndex ];

// Set column value into the structure.
        LOCAL.DataArray[ LOCAL.DataArrayIndex ][ LOCAL.ColumnName ] = ARGUMENTS.Query[ LOCAL.ColumnName ][ LOCAL.RowIndex ];

    }

}


// At this point, we have an array of structure objects that
// represent the rows in the query over the indexes that we
// wanted to convert. If we did not want to convert a specific
// record, return the array. If we wanted to convert a single
// row, then return the just that STRUCTURE, not the array.
if (ARGUMENTS.Row) {

// Return the first array item.
    return( LOCAL.DataArray[ 1 ] );

} else {

// Return the entire array.
    return( LOCAL.DataArray );

}

</cfscript>
</cffunction>


</cfcomponent>