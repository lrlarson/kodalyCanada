<template>
<v-container>
	<v-card>
		<v-card-title class="justify-center">
			{{ songObject.TITLE}}
		</v-card-title>
	</v-card>
	<v-row style="margin-top: 20px;">
		<v-col md8 sm12>
			<v-text-field v-model="songObject.TITLE" label="Main Title"></v-text-field>
			<v-text-field v-model="songObject.ALT_TITLE_1" label="Alt. Title 1"></v-text-field>
			<v-text-field v-model="songObject.ALT_TITLE_2" label="Alt. Title 2"></v-text-field>
		</v-col>
		<v-col md4 sm12>
			<v-row>
				<v-col md2>
					<v-checkbox label="Publish" v-model="songObject.PUBLISH"></v-checkbox>
					<v-checkbox label="Notated" v-model="songObject.INFINALE"></v-checkbox>
					<v-checkbox label="Game" v-model="songObject.GAME"></v-checkbox>
				</v-col>
				<v-col md2>
					<v-checkbox label="IP" v-model="songObject.IP_STATUS"></v-checkbox>
					<v-checkbox label="LOC" v-model="songObject.LOC"></v-checkbox>
					<v-checkbox label="Child" v-model="songObject.CHILD"></v-checkbox>
				</v-col>
			</v-row>
		</v-col>
	</v-row>
	
	<v-row>
		<v-col md6 sm12>
			<v-text-field label="Informant" v-model="songObject.INFORMANT" ></v-text-field>
		</v-col>
		<v-col md6 sm12>
			<v-text-field label="First Line" v-model="songObject.FIRST_LINE_TEXT" ></v-text-field>
		</v-col>
	</v-row>
	<v-row>
		<v-col md6 sm12>
			<v-text-field disabled label="Source"></v-text-field>
			<ckeditor :editor="editor" v-model="songObject.PUBLICATION" :config="editorConfig"></ckeditor>
			<v-text-field disabled label="General Comments"></v-text-field>
			<ckeditor :editor="editor" v-model="songObject.COMMENTS" :config="editorConfig"></ckeditor>
			<v-text-field disabled label="Song Background"></v-text-field>
			<ckeditor :editor="editor" v-model="songObject.SONG_BACKGROUND" :config="editorConfig"></ckeditor>
		</v-col>
	</v-row>
	
	
		<v-layout>
			<v-row>
				<v-col md3>
					<v-text-field disabled label="Upload Score File -- see in Supporting Files"></v-text-field>
					<div id="uppy"></div>
				</v-col>
				<v-col md3>
					<v-text-field disabled label="Upload Audio File"></v-text-field>
					<div id="uppy2"></div>
				</v-col>
				<v-col md3>
					<v-text-field label="Basic File Name USE THIS NAME IN FILES"  v-model="songObject.NOTATION_FILE_NAME"></v-text-field>
				</v-col>
				<v-col md3>
					<v-checkbox v-model="songObject.RECORDING_FLAG" label="Has Recording"></v-checkbox>
				</v-col>
			</v-row>
		</v-layout>
	
	<v-row class="justify-center" style="margin-top: 30px;">
		<v-btn v-if="editMode" color="green" @click="updateSongBasics">Save Basic Song Edits</v-btn>
		<v-btn v-if="addMode" color="green" @click="saveNewSong">Save New Song</v-btn>
	</v-row>
	<v-container v-if="editMode">
		<v-card style="margin-top: 10px;">
			<v-tabs>
				
				<v-tab style="font-size: x-small" ripple key="1" >Analysis</v-tab>
				<v-tab style="font-size: x-small" ripple key="2" >Rhythms</v-tab>
				<v-tab style="font-size: x-small" ripple key="9" @click="regionClick" >Region/Prov.</v-tab>
				<v-tab style="font-size: x-small" ripple key="10" @click="communitiesClick" >Communities</v-tab>
				<v-tab style="font-size: x-small" ripple key="3" @click="pedagogyClick" >Mel. Element</v-tab>
				<v-tab style="font-size: x-small" ripple key="4" @click="rhythmClick" >Rhythms</v-tab>
				<v-tab style="font-size: x-small" ripple key="5" @click="motiveClick" >Motives</v-tab>
				<v-tab style="font-size: x-small" ripple key="6" @click="getGrades" >Grades</v-tab>
				<v-tab style="font-size: x-small" ripple key="7" @click="getSongTypesForSong" >Games-Parts</v-tab>
				<v-tab style="font-size: x-small" ripple key="8" @click="prepareFiles" >Files</v-tab>
			<v-tab-item key="1">
				<v-layout row>
				<v-col md3 style="margin-left: 10px;">
					<v-select
							v-model="songObject.TONALCENTERID"
							label="Tonal Center"
							:items="notesArray"
							item-text="LABEL"
							item-value="DATA"

					></v-select>
				</v-col>
				<v-col md3 style="margin-left: 10px;">
					<v-select
							v-model="songObject.RANGEID"
							label="Range"
							:items="rangeArray"
							item-text="LABEL"
							item-value="DATA"
					
					></v-select>
				</v-col>
					<v-col md3 style="margin-left: 10px;">
						<v-select
								v-model="songObject.SCALEID"
								label="Scale"
								:items="scaleArray"
								item-text="LABEL"
								item-value="DATA"
				
						></v-select>
					</v-col>
				</v-layout>
				<v-layout row>
					<v-col md3 style="margin-left: 10px;">
						<v-text-field v-model="songObject.TONESETID" label="Toneset"></v-text-field>
					</v-col>
					<v-col md3 style="margin-left: 10px;">
						<v-select
								v-model="songObject.STARTING_PITCHID"
								label="Starting Pitch"
								:items="startingPitchArray"
								item-text="LABEL"
								item-value="DATA"
								
						></v-select>
					</v-col>
					<v-col md3 style="margin-left: 10px;">
		
						<v-select
								v-model="songObject.METERID"
								label="Meter"
								:items="metersArray"
								item-text="LABEL"
								item-value="DATA"
						
						></v-select>
					</v-col>
				</v-layout>
				<v-layout row>
					<v-col md3 style="margin-left: 10px;">
						<v-select
								v-model="songObject.FORMTYPEID"
								label="Form Type"
								:items="formTypesArray"
								item-text="LABEL"
								item-value="DATA"
						
						></v-select>
					</v-col>
					<v-col md3 style="margin-left: 10px;">
						<v-select
								v-model="songObject.FORMID"
								label="Formal Analysis"
								:items="formArray"
								item-text="LABEL"
								item-value="DATA"
		
						></v-select>
					</v-col>
					<v-col md3 style="margin-left: 10px;">
						<v-text-field v-model="songObject.FORMANALYSISSTR" label="Form Analysis String"></v-text-field>
					</v-col>
				</v-layout>
				<v-layout>
					<v-row class="justify-center" >
						<v-btn class="justify-center" style="margin-bottom: 30px;" v-if="editMode" color="blue" @click="saveMusicalAnalysis">Save Musical Analysis Edits</v-btn>
					</v-row>
				</v-layout>
			</v-tab-item>
				<v-tab-item key="2">
					<v-layout row>
						<v-simple-table>
							<tbody>
							<tr>
								<td><v-img src="../assets/ta.gif" max-height="40%" max-width="60%" ></v-img> </td>
								<td style="font-size: 20px">ta</td>
								<td><v-checkbox v-model="songObject.TA"></v-checkbox></td>

								<td><v-img src="../assets/tiri_tiri.gif" max-height="40" max-width="60" ></v-img> </td>
								<td style="font-size: 20px">tiri-tiri</td>
								<td><v-checkbox v-model="songObject.TIRI_TIRI"></v-checkbox></td>

								<td><v-img src="../assets/tiri.gif" max-height="55%" max-width="65%" ></v-img> </td>
								<td style="font-size: 20px">tiri</td>
								<td><v-checkbox v-model="songObject.TIRI"></v-checkbox></td>

								<td><v-img src="../assets/ti_ti_ti.gif" max-height="40" max-width="60" ></v-img> </td>
								<td style="font-size: 20px">ti-ti-ti</td>
								<td><v-checkbox v-model="songObject.TI_TI_TI"></v-checkbox></td>

							</tr>
							<tr>
								<td><v-img src="../assets/ti-ti.gif" max-height="40" max-width="60" ></v-img> </td>
								<td style="font-size: 20px">ti-ti</td>
								<td><v-checkbox v-model="songObject.TI_TI"></v-checkbox></td>

								<td><v-img src="../assets/ti-tiri.gif" max-height="40" max-width="60" ></v-img> </td>
								<td style="font-size: 20px">ti-tiri</td>
								<td><v-checkbox v-model="songObject.TI_TIRI"></v-checkbox></td>

								<td><v-img src="../assets/tim-ri.gif" max-height="40" max-width="60" ></v-img> </td>
								<td style="font-size: 20px">tim-ri</td>
								<td><v-checkbox v-model="songObject.TIM_RI"></v-checkbox></td>

								<td><v-img src="../assets/ta_ti.gif" max-height="40" max-width="60" ></v-img> </td>
								<td style="font-size: 20px">ta-ti</td>
								<td><v-checkbox v-model="songObject.TA_TI"></v-checkbox></td>
							</tr>
							<tr>
								<td><v-img src="../assets/rest.gif" max-height="50%" max-width="58%" ></v-img> </td>
								<td style="font-size: 20px">rest</td>
								<td><v-checkbox v-model="songObject.REST"></v-checkbox></td>

								<td><v-img src="../assets/tiri_ti.gif" max-height="40" max-width="60" ></v-img> </td>
								<td style="font-size: 20px">tiri-ti</td>
								<td><v-checkbox v-model="songObject.TIRI_TI"></v-checkbox></td>

								<td><v-img src="../assets/ri_ti_ri.gif" max-height="40" max-width="60" ></v-img> </td>
								<td style="font-size: 20px">ri-ti-ri</td>
								<td><v-checkbox v-model="songObject.RI_TIM_RI"></v-checkbox></td>

								<td><v-img src="../assets/ti_ta.gif" max-height="50%" max-width="75%" ></v-img> </td>
								<td style="font-size: 20px">ti-ta</td>
								<td><v-checkbox v-model="songObject.TI_TA"></v-checkbox></td>
							</tr>
							<tr>
								<td><v-img src="../assets/ta_a.gif" max-height="40%" max-width="60%" ></v-img> </td>
								<td style="font-size: 20px">ta-a</td>
								<td><v-checkbox v-model="songObject.TA_A"></v-checkbox></td>

								<td><v-img src="../assets/syn_co_pa.gif" max-height="58%" max-width="83%" ></v-img> </td>
								<td style="font-size: 20px">syn-co-pa</td>
								<td><v-checkbox v-model="songObject.TI_TA_TI"></v-checkbox></td>

								<td><v-img src="../assets/ri.gif" max-height="55%" max-width="44%" ></v-img> </td>
								<td style="font-size: 20px">ri</td>
								<td><v-checkbox v-model="songObject.RI"></v-checkbox></td>

								<td><v-img src="../assets/tim_ri_ti.gif" max-height="40" max-width="60" ></v-img> </td>
								<td style="font-size: 20px">tim-ri-ti</td>
								<td><v-checkbox v-model="songObject.TIM_RI_TI"></v-checkbox></td>

							</tr>

							<tr>
								<td><v-img src="../assets/half_rest.gif" max-height="40%" max-width="60%" ></v-img> </td>
								<td style="font-size: 20px">half rest</td>
								<td><v-checkbox v-model="songObject.HALF_REST"></v-checkbox></td>

								<td><v-img src="../assets/tai_ti.gif" max-height="40" max-width="60" ></v-img> </td>
								<td style="font-size: 20px">tai-ti</td>
								<td><v-checkbox v-model="songObject.TA_TI"></v-checkbox></td>

								<td><v-img src="../assets/tim.gif" max-height="55%" max-width="44%" ></v-img> </td>
								<td style="font-size: 20px">tim</td>
								<td><v-checkbox v-model="songObject.TIM"></v-checkbox></td>

								<td><v-img src="../assets/ri_tim_ti.gif" max-height="40" max-width="60" ></v-img> </td>
								<td style="font-size: 20px">ri-tim-ri</td>
								<td><v-checkbox v-model="songObject.RI_TIM_RI"></v-checkbox></td>

							</tr>

							<tr>
								<td><v-img src="../assets/ta-a-a.gif" max-height="40%" max-width="60%" ></v-img> </td>
								<td style="font-size: 20px">ta-a-a</td>
								<td><v-checkbox v-model="songObject.TA_A_A"></v-checkbox></td>

								<td><v-img src="../assets/ti_tai.gif" max-height="40" max-width="60" ></v-img> </td>
								<td style="font-size: 20px">ti-tai</td>
								<td><v-checkbox v-model="songObject.TI_TAI"></v-checkbox></td>

								<td><v-img src="../assets/ri_tim.gif" max-height="55%" max-width="64%" ></v-img> </td>
								<td style="font-size: 20px">ri-tim</td>
								<td><v-checkbox v-model="songObject.RI_TIM"></v-checkbox></td>

								<td><v-img src="../assets/ti_tim_ri.gif" max-height="40" max-width="60" ></v-img> </td>
								<td style="font-size: 20px">ti-tim-ri</td>
								<td><v-checkbox v-model="songObject.TI_TIM_RI"></v-checkbox></td>

							</tr>

							<tr>
								<td><v-img src="../assets/ta-a-a-a.gif" max-height="40%" max-width="60%" ></v-img> </td>
								<td style="font-size: 20px">ta-a-a-a</td>
								<td><v-checkbox v-model="songObject.TA_A_A_A"></v-checkbox></td>

								<td><v-img src="../assets/eighth_rest.gif" max-height="67%" max-width="51%" ></v-img> </td>
								<td style="font-size: 20px">eighth rest</td>
								<td><v-checkbox v-model="songObject.EIGHTH_REST"></v-checkbox></td>

								<td><v-img src="../assets/tri_o_la.gif" max-height="55%" max-width="107%" ></v-img> </td>
								<td style="font-size: 20px">tri-o-la</td>
								<td><v-checkbox v-model="songObject.TRI_O_LA"></v-checkbox></td>

								<td><v-img src="../assets/anacrusis.gif" max-height="40" max-width="60" ></v-img> </td>
								<td style="font-size: 20px">anacrusis</td>
								<td><v-checkbox v-model="songObject.ANAC"></v-checkbox></td>
							</tr>

							<tr>
								<td><v-img src="../assets/whole_rest.gif" max-height="40%" max-width="60%" ></v-img> </td>
								<td style="font-size: 20px">whole rest</td>
								<td><v-checkbox v-model="songObject.WHOLE_REST"></v-checkbox></td>

								<td><v-img src="../assets/ti.gif" max-height="67%" max-width="36%" ></v-img> </td>
								<td style="font-size: 20px">ti</td>
								<td><v-checkbox v-model="songObject.TI"></v-checkbox></td>

								<td><v-img src="../assets/tai.gif" max-height="62%" max-width="74%" ></v-img> </td>
								<td style="font-size: 20px">tai</td>
								<td><v-checkbox v-model="songObject.TAI"></v-checkbox></td>

								<td><v-img src="../assets/tie.gif" max-height="40" max-width="60" ></v-img> </td>
								<td style="font-size: 20px">tie</td>
								<td><v-checkbox v-model="songObject.TIE"></v-checkbox></td>
							</tr>

<!--							<tr>-->
<!--								<td><v-img src="../assets/other.gif" max-height="40%" max-width="60%" ></v-img> </td>-->
<!--								<td style="font-size: 20px">other</td>-->
<!--								<td><v-checkbox v-model="songObject.OTHER"></v-checkbox></td>-->
<!--							</tr>-->
							</tbody>
						</v-simple-table>
					</v-layout>
					<v-layout>
						<v-row class="justify-center" >
							<v-btn class="justify-center" style="margin-top: 30px; margin-bottom: 20px;"  v-if="editMode" color="green" @click="saveRythmicEdits">Save Rhythmic Edits</v-btn>
						</v-row>
					</v-layout>
				</v-tab-item>
				<v-tab-item key="9">
					<v-layout row>
						<v-col md6 style="margin-left: 10px;">
							<v-select
									v-model="songObject.REGIONID"
									label="Region"
									:items="regionsArray"
									item-text="LABEL"
									item-value="DATA"
							></v-select>
							<v-select
									v-model="provinceID"
									label="Select Provinces"
									:items="statesArray"
									item-text="LABEL"
									item-value="DATA"
							></v-select>
						</v-col>
						<v-col md6 style="margin-left: 10px;">
							<v-simple-table >
								<template v-slot:default>
									<thead style="font-style: italic;">
										PROVINCES - Click to Delete Province
									</thead>
									<tbody>
										<tr v-for="item in provincesForTitleArray" v-bind:key="item.ID" @click="handleProvinceTableClick(item.ID)">
											{{item.STATE}}
										</tr>
									</tbody>
									
								</template>
							</v-simple-table>
						
						</v-col>
					</v-layout>
					<v-layout>
						<v-row class="justify-center" >
							<v-btn class="justify-center" style="margin-top: 30px; margin-bottom: 20px;"  v-if="editMode" color="blue" @click="saveRegion" >Save Region</v-btn>
							<v-btn class="justify-center" style="margin-top: 30px; margin-bottom: 20px;margin-left: 10px;"  v-if="editMode" color="green" @click="saveProvinceForTitle" >Add Province</v-btn>
						</v-row>
					</v-layout>
				</v-tab-item>
				<v-tab-item key="10">
					<v-layout row v-if="communitiesSaved">
						<v-col md3 style="margin-left: 10px;">
							<v-select
									v-model="communityObjectForSong.LEVEL_1"
									label="General Community"
									:items="generalCommunitiesArray"
									item-text="LABEL"
									item-value="DATA"
									@change="getLevel2Communities(communityObjectForSong.LEVEL_1)"
							></v-select>
						</v-col>
						<v-col md3 style="margin-left: 10px;">
							<v-select
									v-model="communityObjectForSong.LEVEL_2"
									label="Related Community"
									:items="level2CommunitiesArray"
									item-text="LABEL"
									item-value="DATA"
									@change="getLevel3Communities(communityObjectForSong.LEVEL_2)"
							></v-select>
						</v-col>
						<v-col md3 style="margin-left: 10px;">
							<v-select
									v-model="communityObjectForSong.LEVEL_3"
									label="Related Specific Community"
									:items="level3CommunitiesArray"
									item-text="LABEL"
									item-value="DATA"
							></v-select>
						</v-col>
					</v-layout>
					<v-layout row v-else>
						<v-col md3 style="margin-left: 10px;">
							<v-select
									v-model="selectedLevel1Community"
									label="General Community"
									:items="generalCommunitiesArray"
									item-text="LABEL"
									item-value="DATA"
									@change="getLevel2Communities(selectedLevel1Community)"
							></v-select>
						</v-col>
						<v-col md3 style="margin-left: 10px;">
							<v-select
									v-model="selectedLevel2Community"
									label="Related Community"
									:items="level2CommunitiesArray"
									item-text="LABEL"
									item-value="DATA"
									key="selectedLevel2Community"
									@change="getLevel3Communities(selectedLevel2Community)"
							></v-select>
						</v-col>
						<v-col md3 style="margin-left: 10px;">
							<v-select
									v-model="selectedLevel3Community"
									label="Related Specific Community"
									:items="level3CommunitiesArray"
									item-text="LABEL"
									item-value="DATA"
							></v-select>
						</v-col>
					</v-layout>
					<v-layout row class="justify-center" v-if="editMode">
						<v-btn v-if="communitiesSaved" class="justify-center" style="margin-top: 30px; margin-bottom: 20px;"   color="blue" @click="updateCommunityObject" >Change Communities for Song</v-btn>
						<v-btn v-else class="justify-center" style="margin-top: 30px; margin-bottom: 20px;"  color="blue" @click="insertNewCommunityObject" > Save New Communities for Song</v-btn>
					</v-layout>
				</v-tab-item>
				<v-tab-item key="3">
					<v-layout row>
						<v-col md1 style="max-width: fit-content">
<!--							<v-btn color="red" style="margin: 10px;">Delete Selected</v-btn>-->
<!--							<br />-->
							<v-btn color="blue" style="margin: 10px;" @click="setMelContextAddMode">Add New Mel Element</v-btn>
							</v-col>
						<v-col md8>
							<v-simple-table>
								<tbody>
								<tr>
									<td>Melodic Element</td>
									<td>Melodic Context</td>
									<td>Preparation</td>
									<td>Practice</td>
									<td>Tuning Up</td>
									<td>Older</td>
								</tr>
								<tr
										v-for="item in songMelodicElementsArrays"
										:key="item.ID"
										@click="handleMelodicClick(item.ID)"
								>
									<td>{{ item.TONEABBREVIATION }}</td>
									<td>{{ item.CONTEXTNAME}}</td>
									<td><v-checkbox v-model="item.MPREPARATION"></v-checkbox></td>
									<td><v-checkbox v-model="item.MEARLYPRACTICE"></v-checkbox></td>
									<td><v-checkbox v-model="item.MMIDDLEPRACTICE"></v-checkbox></td>
									<td><v-checkbox v-model="item.MLATEPRACTICE"></v-checkbox></td>
								</tr>
								</tbody>
							</v-simple-table>
						</v-col>
					</v-layout>
					<v-layout row v-if="editMelContextMode">
						<v-col md2 style="margin-left: 10px;">
							<v-select
									v-model="songMelodicContextObject.MELODICELEMENTKEY"
									label="Melodic Element"
									:items="melodicElementsArray"
									item-text="LABEL"
									item-value="DATA"
									@change="getCorrectContext()"
									return-object
							></v-select>
						</v-col>
						<v-col md2>
							<v-select
									v-model="songMelodicContextObject.MELODICCONTEXTKEY"
									label="Melodic Context"
									:items="availableMelContextsArray"
									item-text="LABEL"
									item-value="DATA"
									@change="selectMelodicContext()"
									return-object
							></v-select>
						</v-col>
						<v-col md2>
							<v-checkbox v-model="songMelodicContextObject.MPREPARATION" label="Prep."></v-checkbox>
						</v-col>
						<v-col md2>
							<v-checkbox v-model="songMelodicContextObject.MEARLYPRACTICE" label="Practice"></v-checkbox>
						</v-col>
						<v-col md2>
							<v-checkbox v-model="songMelodicContextObject.MMIDDLEPRACTICE" label="Tuning"></v-checkbox>
						</v-col>
						<v-col md2>
							<v-checkbox v-model="songMelodicContextObject.MLATEPRACTICE" label="Older"></v-checkbox>
						</v-col>
					</v-layout>
					<v-layout row v-if="addMelContextMode">
						<v-col md2 style="margin-left: 10px;">
							<v-select
									v-model="songMelodicContextObject.MELODICELEMENTKEY"
									label="Melodic Element"
									:items="melodicElementsArray"
									item-text="LABEL"
									item-value="DATA"
									@change="getCorrectContext()"
									return-object
							></v-select>
						</v-col>
						<v-col md2>
							<v-select
									v-model="songMelodicContextObject.MELODICCONTEXTKEY"
									label="Melodic Context"
									:items="availableMelContextsArray"
									item-text="LABEL"
									item-value="DATA"
									@change="selectMelodicContext()"
									return-object
							></v-select>
						</v-col>
						<v-col md2>
							<v-checkbox v-model="songMelodicContextObject.MPREPARATION" label="Prep."></v-checkbox>
						</v-col>
						<v-col md2>
							<v-checkbox v-model="songMelodicContextObject.MEARLYPRACTICE" label="Practice"></v-checkbox>
						</v-col>
						<v-col md2>
							<v-checkbox v-model="songMelodicContextObject.MMIDDLEPRACTICE" label="Tuning"></v-checkbox>
						</v-col>
						<v-col md2>
							<v-checkbox v-model="songMelodicContextObject.MLATEPRACTICE" label="Older"></v-checkbox>
						</v-col>
					</v-layout>
					<v-row class="justify-center">
						<v-btn v-if="editMelContextMode" @click="updateMelodicContext" color="green" style="margin-bottom: 20px;">Save Mel. Element Edits</v-btn>
						<v-btn v-if="editMelContextMode" @click="delMelContext" color="red" style="margin-bottom: 20px; margin-left: 10px;">Delete This Melodic Element </v-btn>
						<v-btn v-if="addMelContextMode" @click="insertNewMelContext" color="green" style="margin-bottom: 20px;">Save New Melodic Context</v-btn>
					</v-row>
				</v-tab-item>
				<v-tab-item key="4">
					<v-layout row>
						<v-col md1 style="max-width: fit-content">
							<!--							<v-btn color="red" style="margin: 10px;">Delete Selected</v-btn>-->
							<!--							<br />-->
							<v-btn color="blue" style="margin: 10px;" @click="setRythmContextAddMode">Add New Rhythmic Element</v-btn>
						</v-col>
						<v-col md8>
							<v-simple-table>
								<tbody>
								<tr>
									<td>Rhythm Name</td>
									<td>Preparation</td>
									<td>Early</td>
									<td>Tuning Up</td>
									<td>Older</td>
								</tr>
								<tr
										v-for="item in songRhythmicElementsArray"
										:key="item.ID"
										@click="handleRhythmicClick(item.ID)"
								>
									<td>{{ item.RYTHMNAME }}</td>
									<td><v-checkbox v-model="item.RPREPARATION"></v-checkbox></td>
									<td><v-checkbox v-model="item.REARLY"></v-checkbox></td>
									<td><v-checkbox v-model="item.RMIDDLE"></v-checkbox></td>
									<td><v-checkbox v-model="item.RLATE"></v-checkbox></td>
								</tr>
								</tbody>
							</v-simple-table>
						</v-col>
					</v-layout>
					<v-layout row v-if="editRhythymicMode">
						<v-col md2 style="margin-left: 10px;">
							<v-select
									v-model="rhythmicContextObject.RYTHMNAME"
									label="Rhythmic Element"
									:items="rhythmicContextsArray"
									item-text="LABEL"
									item-value="DATA"
									return-object
							></v-select>
						</v-col>
						<v-col md2>
							<v-checkbox v-model="rhythmicContextObject.RPREPARATION" label="Prep."></v-checkbox>
						</v-col>
						<v-col md2>
							<v-checkbox v-model="rhythmicContextObject.REARLY" label="Practice"></v-checkbox>
						</v-col>
						<v-col md2>
							<v-checkbox v-model="rhythmicContextObject.RMIDDLE" label="Tuning"></v-checkbox>
						</v-col>
						<v-col md2>
							<v-checkbox v-model="rhythmicContextObject.RLATE" label="Older"></v-checkbox>
						</v-col>
					</v-layout>
					<v-layout row v-if="addRhythymicMode">
						<v-col md2 style="margin-left: 10px;">
							<v-select
									v-model="rhythmicContextObject.RYTHMNAME"
									label="Rhythmic Element"
									:items="rhythmicContextsArray"
									item-text="LABEL"
									item-value="DATA"
									return-object
							></v-select>
						</v-col>
						<v-col md2>
							<v-checkbox v-model="rhythmicContextObject.RPREPARATION" label="Prep."></v-checkbox>
						</v-col>
						<v-col md2>
							<v-checkbox v-model="rhythmicContextObject.REARLY" label="Practice"></v-checkbox>
						</v-col>
						<v-col md2>
							<v-checkbox v-model="rhythmicContextObject.RMIDDLE" label="Tuning"></v-checkbox>
						</v-col>
						<v-col md2>
							<v-checkbox v-model="rhythmicContextObject.RLATE" label="Older"></v-checkbox>
						</v-col>
					</v-layout>
					<v-row class="justify-center">
						<v-btn v-if="editRhythymicMode" @click="saveRhythmicContextEdits" color="green" style="margin-bottom: 20px;">Save Rhythmic Context Edits</v-btn>
						<v-btn v-if="editRhythymicMode" @click="deleteRhythmicContext" color="red" style="margin-bottom: 20px; margin-left: 10px;">Delete This Rhythmic Context </v-btn>
						<v-btn v-if="addRhythymicMode" @click="insertNewRhythmicContext" color="green" style="margin-bottom: 20px;">Save New Rhythmic Context</v-btn>
					</v-row>
				</v-tab-item>
				<v-tab-item key="5" >
					<v-layout row align-center>
						<v-col md2>
							<v-btn color="green" style="margin-left: 10px;" @click="addMotive=true">Add Motive</v-btn>
						</v-col>
						<v-col md3>
							<v-simple-table>
								<tbody>
								<tr>
									<td>Motives</td>
								</tr>
								<tr
										v-for="item in motivesForSongArray"
										:key="item.MOTIVE"
										@click="handleMotiveClick(item.TITLE_ID,item.MOTIVE)"
								>
									<td>{{ item.MOTIVE }}</td>
								</tr>
								</tbody>
							</v-simple-table>
						</v-col>
						<v-col md6>
							<v-text-field v-if="editMotive" v-model="motiveObject.MOTIVE"></v-text-field>
							<v-btn v-if="editMotive" color="red" @click="deleteMotive">Delete Motive</v-btn>
						</v-col>
						<v-col md6>
							<v-text-field v-if="addMotive" v-model="motiveObject.MOTIVE"></v-text-field>
							<v-btn v-if="addMotive" color="green" @click="insertMotive">Add Motive</v-btn>
						</v-col>
					</v-layout>
				</v-tab-item>
				<v-tab-item key="6">
					<v-layout row align-center>
						<v-col md2>
							<v-text-field style="margin-left: 10px;" v-model="gradeObject.GRADE_STRING" label="Grade Summary" ></v-text-field>
						</v-col>
						<v-col md1>
							<v-checkbox v-model="gradeObject.CH" label="pre-k">Pre-K</v-checkbox>
						</v-col>
						<v-col md1>
							<v-checkbox v-model="gradeObject.K" label="K">K</v-checkbox>
						</v-col>
						<v-col md1>
							<v-checkbox v-model="gradeObject.ONE" label="1">1</v-checkbox>
						</v-col>
						<v-col md1>
							<v-checkbox v-model="gradeObject.TWO" label="2">1</v-checkbox>
						</v-col>
						<v-col md1>
							<v-checkbox v-model="gradeObject.THREE" label="3">1</v-checkbox>
						</v-col>
						<v-col md1>
							<v-checkbox v-model="gradeObject.FOUR" label="4">1</v-checkbox>
						</v-col>
						<v-col md1>
							<v-checkbox v-model="gradeObject.FIVE" label="5">1</v-checkbox>
						</v-col>
						<v-col md1>
							<v-checkbox v-model="gradeObject.SIX" label="6">1</v-checkbox>
						</v-col>
						<v-col md1>
							<v-checkbox v-model="gradeObject.SEVEN" label="7">1</v-checkbox>
						</v-col>
						<v-col md1>
							<v-checkbox v-model="gradeObject.EIGHT" label="8">1</v-checkbox>
						</v-col>
					</v-layout>
					<v-layout row>
						<v-col md1>
							<v-checkbox v-model="gradeObject.TEN" label="High School">1</v-checkbox>
						</v-col>
						<v-col md1>
							<v-checkbox v-model="gradeObject.ZERO" label="Older Beginner">1</v-checkbox>
						</v-col>
						<v-col md3>
							<v-btn color="green" @click="saveGrades">Save Grade Data</v-btn>
						</v-col>
					</v-layout>
				</v-tab-item>
				<v-tab-item key="7">
					
						<v-card>
						<v-card-title class="justify-center" style="margin-bottom: 10px;">
							Song Types
						</v-card-title>
							</v-card>
					
					<v-layout row align-center style="margin-top: 10px;">
						<v-row>
							<v-col md2>
								<v-btn color="blue" style="margin-left: 10px;height: 50px;" @click="addSongType">Add Song Type</v-btn>
							</v-col>
							<v-col md2>
								<v-select
										v-model="selectedSongType"
										label="Song Type"
										:items="songTypesArry"
										item-text="LABEL"
										item-value="DATA"
										return-object
										style="margin-left: 20px;"
								></v-select>
							</v-col>
							
							<v-col md3>
								<v-simple-table style="margin-top: 10px;">
									<tbody>
									<tr>Song Types - Click to Select</tr>
									<tr
											v-for="item in songTypesArrayForSong"
											:key="item.ID"
											@click="handleSongTypeClick(item.ID, item.SONGTYPE)"
									>
										<td>{{ item.SONGTYPE }}</td>
									</tr>
									</tbody>
								</v-simple-table>
							</v-col>
						</v-row>
					</v-layout>
					<v-layout>
						<v-row v-if="songTypeSelected">
							<v-col md2 >
								<v-btn  color="red" style="margin-left: 10px;height: 50px;" @click="deleteSongType">Delete Song Type {{selectedSongTypeName}}</v-btn>
							</v-col>
							<v-col md2 >
								<v-btn   style="margin-left: 10px;height: 50px;" @click="clearClicks"> Clear</v-btn>
							</v-col>
						</v-row>
					</v-layout>
					
				
					<v-card>
						<v-card-title class="justify-center" style="margin-bottom: 10px;">
							Game Types
						</v-card-title>
					</v-card>
					<v-layout row>
						<v-col md2>
							<v-btn color="blue" @click="insertNewGameType">Add Game Type</v-btn>
						</v-col>
						<v-col md2>
							<v-select
									v-model="selectedGameType"
									label="Game Type"
									:items="gameTypesArray"
									item-text="LABEL"
									item-value="DATA"
									return-object
									style="margin-left: 20px;"
									@change="getSubGameTypes()"
							></v-select>
						</v-col>
						<v-col md2>
							<v-select
									v-model="selectedSubGameType"
									label="Sub-Game Type"
									:items="subGamesTypesArray"
									item-text="LABEL"
									item-value="DATA"
									return-object
									style="margin-left: 20px;"
							></v-select>
						</v-col>
						<v-col md3>
							<v-simple-table style="margin-top: 10px;">
								<tbody>
								<tr>
									<td>Game Type</td>
									<td>Sub-Game Type</td>
								</tr>
								<tr
										v-for="item in gameTypesArrayForSong"
										:key="item.ID"
										@click="handleGameTypeClick(item.ID)"
								>
									<td>{{ item.GAMETYPE }}</td>
									<td>{{ item.SUBGAMETYPE }}</td>
								</tr>
								</tbody>
							</v-simple-table>
						</v-col>
					</v-layout>
					<v-layout>
						<v-row v-if="gameTypeSelected">
							<v-col md2 >
								<v-btn  color="red" style="margin-left: 10px;height: 50px;" @click="deleteGameType">Delete Game Type {{selectedGameTypeName}} -- {{selectedSubGameTypeName}}</v-btn>
							</v-col>
							<v-col md2 >
								<v-btn   style="margin-left: 10px;height: 50px;" @click="clearClicks"> Clear</v-btn>
							</v-col>
						</v-row>
					</v-layout>
					<v-card>
						<v-card-title class="justify-center" style="margin-bottom: 10px;">
							Figures
						</v-card-title>
					</v-card>
					<v-layout row>
						<v-col md2>
							<v-btn color="blue" @click="insertFigureToSong">Add Figure to Song</v-btn>
						</v-col>
						<v-col md2>
							<v-select
									v-model="selectedFigure"
									label="Figures"
									:items="figuresArray"
									item-text="LABEL"
									item-value="DATA"
									return-object
									style="margin-left: 20px;"
							></v-select>
						</v-col>
						<v-col md3>
							<v-simple-table style="margin-top: 10px;">
								<tbody>
								<tr>
									<td>FIGURES</td>
									
								</tr>
								<tr
										v-for="item in figuresForSongArray"
										:key="item.FIGURE_TITLE_ID"
										@click="handleFigureClick(item.FIGURE_TITLE_ID,item.FIGURE)"
								>
									<td>{{ item.FIGURE }}</td>
								</tr>
								</tbody>
							</v-simple-table>
						</v-col>
					</v-layout>
					<v-layout>
						<v-row v-if="figureSelected">
							<v-col md2 >
								<v-btn  color="red" style="margin-left: 10px;height: 50px;" @click="deleteFigureFromSong">Delete Figure {{selectedFigureName}} from song </v-btn>
							</v-col>
							<v-col md2 >
								<v-btn   style="margin-left: 10px;height: 50px;" @click="clearClicks"> Clear</v-btn>
							</v-col>
						</v-row>
					</v-layout>
					<v-card>
						<v-card-title class="justify-center" style="margin-bottom: 10px;">
							Subjects
						</v-card-title>
					</v-card>
					<v-layout row>
						<v-col md2>
							<v-btn color="blue" @click="insertNewSubject">Add Subject to Song</v-btn>
						</v-col>
						<v-col md2>
							<v-select
									v-model="selectedSubject"
									label="Subjects"
									:items="subjectsArray"
									item-text="LABEL"
									item-value="DATA"
									return-object
									style="margin-left: 20px;"
									@change="getSubSubjects()"
							></v-select>
						</v-col>
						<v-col md2>
							<v-select
									v-model="selectedSubSubject"
									label="Sub-Subjects"
									:items="subSubjectsArray"
									item-text="LABEL"
									item-value="DATA"
									return-object
									style="margin-left: 20px;"
							></v-select>
						</v-col>
						<v-col md3>
							<v-simple-table style="margin-top: 10px;">
								<tbody>
								<tr>
									<td>SUBJECT</td>
									<td>SUB-SUBJECT</td>
								</tr>
								<tr
										v-for="item in subjectsForSongArray"
										:key="item.ID_TITLE_SUBJECT"
										@click="handleSubjectClick(item.ID_TITLE_SUBJECT)"
								>
									<td>{{ item.SUBJECTHEADING }}</td>
									<td>{{ item.SUBSUBJECTHEADING }}</td>
								</tr>
								</tbody>
							</v-simple-table>
						</v-col>
					</v-layout>
					<v-layout>
						<v-row v-if="subjectSelected">
							<v-col md2 >
								<v-btn  color="red" style="margin-left: 10px;height: 50px;" @click="deleteSubjectFromSong"> Delete Subject -- {{subjectObject.SUBJECTHEADING}} -- {{subjectObject.SUBSUBJECTHEADING}}</v-btn>
							</v-col>
							<v-col md2 >
								<v-btn   style="margin-left: 10px;height: 50px;" @click="clearClicks"> Clear</v-btn>
							</v-col>
						</v-row>
					</v-layout>
					<v-card>
						<v-card-title class="justify-center" style="margin-bottom: 10px;">
							Part-Work
						</v-card-title>
					</v-card>
					<v-layout row>
						<v-col md2>
							<v-btn color="blue" @click="insertPartWorkForSong">Add Part-Work to Song</v-btn>
						</v-col>
						<v-col md2>
							<v-select
									v-model="selectedPartWork"
									label="Part-Work"
									:items="partWorkNamesArray"
									item-text="LABEL"
									item-value="DATA"
									return-object
									style="margin-left: 20px;"
							></v-select>
						</v-col>
						<v-col md3>
							<v-text-field label="Part Context" v-model="selectedPartContext"></v-text-field>
						</v-col>
						<v-col md3>
							<v-simple-table style="margin-top: 10px;">
								<tbody>
								<tr>
									<td>Part-Work</td>
									<td>Part-Work Context</td>
								
								</tr>
								<tr
										v-for="item in partWorkNamesArrayForSong"
										:key="item.TITLEPARTKEY"
										@click="handlePartClick(item.TITLEPARTKEY,item.PARTWORKNAME)"
								>
									<td>{{ item.PARTWORKNAME }}</td>
									<td>{{ item.PART_WORK_CONTEXT_STRING }}</td>
								</tr>
								</tbody>
							</v-simple-table>
						</v-col>
					</v-layout>
					<v-layout>
						<v-row v-if="partWorkSelected">
							<v-col md2 >
								<v-btn  color="red" style="margin-left: 10px;height: 50px;" @click="deletePartWorkFromSong"> Delete Part-Work-- {{clickedPartName}}</v-btn>
							</v-col>
							<v-col md2 >
								<v-btn   style="margin-left: 10px;height: 50px;" @click="clearClicks"> Clear</v-btn>
							</v-col>
						</v-row>
					</v-layout>
				</v-tab-item>
				<v-tab-item key="8">
					<v-card>
						<v-card-title class="justify-center" style="margin-bottom: 10px;">
							Supporting Files -- Score and Audio
						</v-card-title>
					</v-card>
					<v-layout row>
						<v-col md6>
							<v-text-field disabled label="Score File" style="margin-top: 10px;margin-left: 10px;"></v-text-field>
								<vue-pdf-embed :source="songPDFLocation" />
						
						</v-col>
						<v-col md6>
							
								<v-text-field disabled label="Audio File" style="margin-top: 10px;"></v-text-field>
								<vuetify-audio :file=soundFile></vuetify-audio>
							
						</v-col>
					</v-layout>
				</v-tab-item>
				
			</v-tabs>
		</v-card>

	</v-container>
	<v-snackbar v-model="snackbar">
		{{ text }}
		<template v-slot:action="{ attrs }">
			<v-btn
					color="pink"
					text
					v-bind="attrs"
					@click="snackbar = false"
					:timeout="timeout"
			>
				Close
			</v-btn>
		</template>
	</v-snackbar>
</v-container>
</template>

<script>
import axios from "axios";
import VuePdfEmbed from 'vue-pdf-embed/dist/vue2-pdf-embed';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
import Uppy from '@uppy/core'
import XHRUpload from '@uppy/xhr-upload'
import Dashboard from '@uppy/dashboard'
require('@uppy/core/dist/style.css')
require('@uppy/dashboard/dist/style.css')
export default {
	components:{
		VuePdfEmbed,
		VuetifyAudio: () => import('vuetify-audio'),
	},
	
	name: "SongDetail",
	data: () => ({
		dataURL: "https://kodalycollection.org/data/kodaly_canadaVue.cfc?",
		songArray:[],
		songObject:{},
		melodicElementsArray:[],
		songMelodicElementsArrays:[],
		availableMelContextsArray:[],
		songID:'',
		editMode:false,
		addMode:false,
		statesArray:[],
		regionsArray:[],
		ethnicityArray:[],
		notesArray:[],
		rangeArray:[],
		scaleArray:[],
		startingPitchArray:[],
		formTypesArray:[],
		metersArray:[],
		formArray:[],
		addMelContextMode:false,
		editMelContextMode:false,
		addRhythymicMode:false,
		editRhythymicMode:false,
		songMelodicContextArray:[],
		songMelodicContextObject:{},
		songRhythmicElementsArray:[],
		rhythmicContextArray:[],
		rhythmicContextObject:{},
		motivesForSongArray:[],
		editorConfig:{

		},
		editor: ClassicEditor,
		editorData: '',
		rhythmicContextsArray:[],
		editMotive:false,
		addMotive:false,
		motiveArray:[],
		motiveObject:{},
		gradesArray:[],
		gradeObject:{},
		songTypesArrayForSong:[],
		songTypesArry:[],
		selectedSongType:'',
		songTypeSelected:false,
		selectedSongTypeRow:'',
		selectedSongTypeName:'',
		gameTypesArray:[],
		gameTypesArrayForSong:[],
		selectedGameType:'',
		selectedSubGameType:'',
		subGamesTypesArray:[],
		gameTypeArrayForSong:[],
		gameTypeObjectForSong:{},
		gameTypeSelected:false,
		selectedGameTypeName:'',
		selectedSubGameTypeName:'',
		figuresArray:[],
		selectedFigure:'',
		figuresForSongArray:[],
		figureSelected:false,
		songFigureArray:[],
		songFigureObject:{},
		selectedFigureName:'',
		subjectsArray:[],
		subSubjectsArray:[],
		subjectsForSongArray:[],
		selectedSubject:'',
		selectedSubSubject:'',
		subjectSelected:false,
		subjectObjectArray:[],
		subjectObject:{},
		selectedSubjectString:'',
		selectedSubSubjectString:'',
		partWorkNamesArray:[],
		partWorkNamesArrayForSong:[],
		partWorkSelected:false,
		selectedPartWork:'',
		selectedPartContext:'',
		clickedPartName:'',
		clickedPartID:'',
		songPDFLocation:'',
		soundFile:'',
		snackbar: false,
		text:'',
		timeout: 1000,
		generalCommunitiesArray:[],
		provinceID:0,
		provincesForTitleArray:[],
		communityArrayForSong:[],
		communityObjectForSong:{},
		level2CommunitiesArray:[],
		level3CommunitiesArray:[],
		communitiesSaved:false,
		selectedLevel1Community:0,
		selectedLevel2Community:0,
		selectedLevel3Community:0,
		musicalAnalysisObject:{},
		
		
		
	}),
	methods:{
		
		updateCommunityObject(){
			let vm = this;
			axios.get(vm.dataURL + 'method=updateCommunityObject&level1ID=' + vm.communityObjectForSong.LEVEL_1+ '&level2ID=' + vm.communityObjectForSong.LEVEL_2 + '&level3ID=' + vm.communityObjectForSong.LEVEL_3 + '&songID=' + vm.songID)
				.then(response => {
					console.log(response);
					vm.communitiesSaved = true;
					vm.text = 'Community Object Updated';
					vm.snackbar = true;
					vm.communitiesClick();
				})
				.catch(error => {
					console.log(error);
				});
		},
		
		
		insertNewCommunityObject(){
			let vm = this;
			axios.get(vm.dataURL + 'method=insertNewCommunityObject&level1ID=' + vm.selectedLevel1Community + '&level2ID=' + vm.selectedLevel2Community + '&level3ID=' + vm.selectedLevel3Community + '&songID=' + vm.songID)
				.then(response => {
					console.log(response);
					vm.communitiesSaved = true;
					vm.text = 'Community Object Saved';
					vm.snackbar = true;
					vm.communitiesClick();
				})
				.catch(error => {
					console.log(error);
				});
		},
		communitiesClick(){
			let vm = this;
			axios.get(vm.dataURL + 'method=getGeneralCommunities')
				.then(response => {
					vm.generalCommunitiesArray = response.data.results;
				})
				.catch(error => {
					console.log(error);
				});
			axios.get(vm.dataURL + 'method=getCommunityArrayForSong&songID=' + vm.songID)
				.then(response => {
					vm.communityArrayForSong = response.data.results;
					vm.communityObjectForSong = vm.communityArrayForSong[0];
					if (vm.communityObjectForSong.LEVEL_1) {
						vm.communitiesSaved = true;
						//alert(vm.communityObjectForSong.LEVEL_1);
						vm.getLevel2Communities(vm.communityObjectForSong.LEVEL_1);
						vm.getLevel3Communities(vm.communityObjectForSong.LEVEL_2);
					}
				})
				.catch(error => {
					console.log(error);
				});
			
		},
		getLevel2Communities(level1ID){
			let vm = this;
			//alert('level 1 ' + level1ID);
			axios.get(vm.dataURL + 'method=getLevel2Community&level1ID=' + level1ID)
				.then(response => {
					vm.level2CommunitiesArray = response.data.results;
				})
				.catch(error => {
					console.log(error);
				});
		},
		getLevel3Communities(level2ID){
			let vm = this;
			//alert('level 2 ' + level2ID);
			axios.get(vm.dataURL + 'method=getLevel3Community&level2ID=' + level2ID)
				.then(response => {
					vm.level3CommunitiesArray = response.data.results;
				})
				.catch(error => {
					console.log(error);
				});
		},
		handleProvinceTableClick(id){
			let vm = this;
			axios.get(vm.dataURL + 'method=deleteStateForTitle&id=' + id)
				.then(response => {
					console.log(response);
					vm.text = 'Province Deleted from Song';
					vm.snackbar = true;
					vm.regionClick();
				})
				.catch(error => {
					console.log(error);
				});
		},
		
		regionClick(){
			let vm = this;
			axios.get(vm.dataURL + 'method=getStatesForTitle&songID=' + vm.songID)
				.then(response => {
					vm.provincesForTitleArray = response.data.results;
				})
				.catch(error => {
					console.log(error);
				});
		},
		
		saveRegion(){
			let vm = this;
			axios.get(vm.dataURL + 'method=saveRegionForTitle&songID=' + vm.songID + '&regionID=' + vm.songObject.REGIONID)
				.then(response => {
					console.log(response);
					vm.text = 'Region Saved';
					vm.snackbar = true;
					vm.regionClick();
				})
				.catch(error => {
					console.log(error);
				});
			
		},
		
		saveProvinceForTitle(){
			let vm = this;
			axios.get(vm.dataURL + 'method=saveStateForTitle&songID=' + vm.songID + '&stateID=' + vm.provinceID)
				.then(response => {
					console.log(response);
					vm.text = 'Province Saved';
					vm.snackbar = true;
					vm.regionClick();
				})
				.catch(error => {
					console.log(error);
				});
		},
		
		saveNewSong(){
			let vm = this;

			
			window.$.ajax({
				type: "post",
				url: vm.dataURL,
				dataType: "json",
				data: {
					method: "insertNewSong",
					SongDetails: JSON.stringify(vm.songObject)
				},
				success: function (result) {
					alert(result.results[0].NEWID);
					vm.songID =  result.results[0].NEWID;
					console.log(result.results[0].NEWID);
					// console.log('song ID' + vm.songID);
					vm.text = 'New Song Saved'
					vm.snackbar = true;
					vm.addMode=false;
					vm.editMode=true;
					vm.getSongDetails(vm.songID);
				},
				error: function (jqXHR, exception) {
					var msg = "";
					if (jqXHR.status === 0) {
						msg = "Not connect.\n Verify Network.";
					} else if (jqXHR.status == 404) {
						msg = "Requested page not found. [404]";
					} else if (jqXHR.status == 500) {
						msg = "Internal Server Error [500].";
					} else if (exception === "parsererror") {
						msg = "Requested JSON parse failed.";
					} else if (exception === "timeout") {
						msg = "Time out error.";
					} else if (exception === "abort") {
						msg = "Ajax request aborted.";
					} else {
						msg = "Uncaught Error.\n" + jqXHR.responseText;
					}
					alert(msg);
				}
			});
		},
		
		
		saveRythmicEdits(){
			let vm = this;
			window.$.ajax({
				type: "post",
				url: vm.dataURL,
				dataType: "json",
				data: {
					method: "saveRythmicEdits",
					songDetails: JSON.stringify(vm.songObject)
				},
				success: function () {
					vm.getSongDetails(vm.songID);
					vm.text = 'Rhythmic Edits Saved';
					vm.snackbar = true;
				},
				error: function (jqXHR, exception) {
					var msg = "";
					if (jqXHR.status === 0) {
						msg = "Not connect.\n Verify Network.";
					} else if (jqXHR.status == 404) {
						msg = "Requested page not found. [404]";
					} else if (jqXHR.status == 500) {
						msg = "Internal Server Error [500].";
					} else if (exception === "parsererror") {
						msg = "Requested JSON parse failed.";
					} else if (exception === "timeout") {
						msg = "Time out error.";
					} else if (exception === "abort") {
						msg = "Ajax request aborted.";
					} else {
						msg = "Uncaught Error.\n" + jqXHR.responseText;
					}
					alert(msg);
				}
			});
		},
		
		saveMusicalAnalysis(){
			let vm = this;
			
			vm.musicalAnalysisObject.ID = vm.songID;
			if (!vm.songObject.FORMID ){
				vm.songObject.FORMID = 0;
			}
			vm.musicalAnalysisObject.FORMID = vm.songObject.FORMID;
		
			if (!vm.songObject.METERID ){
				vm.songObject.METERID = 0;
			}
			vm.musicalAnalysisObject.METERID = vm.songObject.METERID;
	
			if (!vm.songObject.RANGEID ){
				vm.songObject.RANGEID = 0;
			}
			vm.musicalAnalysisObject.RANGEID = vm.songObject.RANGEID;

			if (!vm.songObject.SCALEID ){
				vm.songObject.SCALEID = 0;
			}
			vm.musicalAnalysisObject.SCALEID = vm.songObject.SCALEID;

			if (!vm.songObject.STARTING_PITCHID ){
				vm.songObject.STARTING_PITCHID = 0;
			}
			vm.musicalAnalysisObject.STARTING_PITCHID = vm.songObject.STARTING_PITCHID;
			if (!vm.songObject.TONALCENTERID ){
				vm.songObject.TONALCENTERID = 0;
			}
			vm.musicalAnalysisObject.TONALCENTERID = vm.songObject.TONALCENTERID;

			vm.musicalAnalysisObject.TONESETID = vm.songObject.TONESETID;
			vm.musicalAnalysisObject.FORMTYPEID = vm.songObject.FORMTYPEID;
			vm.musicalAnalysisObject.FORMANALYSISSTR = vm.songObject.FORMANALYSISSTR;
			
			window.$.ajax({
				type: "post",
				url: vm.dataURL,
				dataType: "json",
				data: {
					method: "saveMusicAnalysis",
					songDetails: JSON.stringify(vm.musicalAnalysisObject)
				},
				success: function () {
					vm.getSongDetails(vm.songID);
					vm.text = 'Musical Analysis  Saved';
					vm.snackbar = true;
				},
				error: function (jqXHR, exception) {
					var msg = "";
					if (jqXHR.status === 0) {
						msg = "Not connect.\n Verify Network.";
					} else if (jqXHR.status == 404) {
						msg = "Requested page not found. [404]";
					} else if (jqXHR.status == 500) {
						msg = "Internal Server Error [500].";
					} else if (exception === "parsererror") {
						msg = "Requested JSON parse failed.";
					} else if (exception === "timeout") {
						msg = "Time out error.";
					} else if (exception === "abort") {
						msg = "Ajax request aborted.";
					} else {
						msg = "Uncaught Error.\n" + jqXHR.responseText;
					}
					alert(msg);
				}
			});
			
		},
		
		updateSongBasics(){
			let vm = this;
			window.$.ajax({
				type: "post",
				url: vm.dataURL,
				dataType: "json",
				data: {
					method: "updateSongBasic",
					SongDetails: JSON.stringify(vm.songObject)
				},
				success: function () {
					vm.getSongDetails(vm.songID);
					vm.text = 'Basic Song Info. Saved';
					vm.snackbar = true;
				},
				error: function (jqXHR, exception) {
					var msg = "";
					if (jqXHR.status === 0) {
						msg = "Not connect.\n Verify Network.";
					} else if (jqXHR.status == 404) {
						msg = "Requested page not found. [404]";
					} else if (jqXHR.status == 500) {
						msg = "Internal Server Error [500].";
					} else if (exception === "parsererror") {
						msg = "Requested JSON parse failed.";
					} else if (exception === "timeout") {
						msg = "Time out error.";
					} else if (exception === "abort") {
						msg = "Ajax request aborted.";
					} else {
						msg = "Uncaught Error.\n" + jqXHR.responseText;
					}
					alert(msg);
				}
			});
		},
		
		clearClicks(){
			this.partWorkSelected=false;
			this.subjectSelected=false;
			this.figureSelected = false;
			this.gameTypeSelected=false;
			this.songTypeSelected=false;
			
		},
		
		prepareFiles(){
			let vm = this;
			vm.songPDFLocation = 'https://kodalycollection.org/Scores/'+ vm.songObject.NOTATION_FILE_NAME + '.pdf';

			
		},
		
		prepareUppy() {
		
		
		
		},
		
		deletePartWorkFromSong(){
			let vm = this;
			axios.get(vm.dataURL + 'method=deletePartWorkForSong&tableID=' + vm.clickedPartID)
					.then(function (){
						vm.getPartWorkForSong();
						vm.partWorkSelected = false;
						vm.clickedPartID = '';
						vm.clickedPartName = '';
					})
		},
		
		handlePartClick(id,partName){
			let vm = this;
			vm.partWorkSelected = true;
			vm.clickedPartID = id;
			vm.clickedPartName = partName;
		},
		
		insertPartWorkForSong(){
			let vm = this;
			axios.get(vm.dataURL+ 'method=insertPartWorkForSong&titleKey=' + vm.songID + '&partWorkKey='+ vm.selectedPartWork.DATA + '&partWorkContextString=' + vm.selectedPartContext)
					.then(function (){
						vm.getPartWorkForSong();
					})
		},
		
		getPartWorkForSong(){
			let vm = this;
			axios.get(vm.dataURL + 'method=getPartWorkForSong&titleKey=' + vm.songID)
					.then(function (result){
						vm.partWorkNamesArrayForSong = result.data.results;
					})
		},
		
		
		getPartWorkArray(){
			let vm = this;
			axios.get(vm.dataURL + 'method=getPartWorkNames')
					.then(function (result){
						vm.partWorkNamesArray = result.data.results;
					})
		},
		
		deleteSubjectFromSong(){
			let vm = this;
			axios.get(vm.dataURL + 'method=deleteSubjectFromSong&ID_TITLE_SUBJECT=' + vm.subjectObject.ID_TITLE_SUBJECT)
					.then(function (){
						vm.getSubjectsForSong();
						vm.subjectSelected = false;
					})
			
			
		},
		
		handleSubjectClick(id){
			let vm = this;
			vm.subjectSelected = true;
			console.log(id);
			axios.get(vm.dataURL + 'method=getSubjectObject&id=' + id)
					.then(function (result){
						vm.subjectObjectArray = result.data.results;
						vm.subjectObject=vm.subjectObjectArray[0];
						
						
					} )
			
		},
		
		insertNewSubject(){
			let vm = this;
			axios.get(vm.dataURL + 'method=insertNewSubject&titleKey=' + vm.songID +'&subjectKey=' + vm.selectedSubject.DATA + '&subSubjectKey=' + vm.selectedSubSubject.DATA)
					.then(function (){
						vm.getSubjectsForSong();
					})
		},
		
		getSubSubjects(){
			let vm = this;
			axios.get(vm.dataURL + 'method=getSubSubjects&mainSubject=' + vm.selectedSubject.DATA)
						.then(function (result){
							vm.subSubjectsArray = result.data.results;
						})
		},
		
		getSubjectsForSong(){
			let vm = this;
			axios.get(vm.dataURL+'method=getSubjectsForSong&titleKey=' + vm.songID )
					.then(function (result){
						vm.subjectsForSongArray = result.data.results;
					})
		},
		
		getSubjects(){
			let vm = this;
			axios.get(vm.dataURL + 'method=getSubjects')
					.then(function (result){
						vm.subjectsArray = result.data.results;
					})
		},
		
		deleteFigureFromSong(){
			let vm = this;
			axios.get(vm.dataURL + 'method=deleteFigureFromSong&Figure_Title_ID=' + vm.songFigureObject.FIGURE_TITLE_ID)
					.then(function (){
						vm.figureSelected = false;
						vm.getFiguresForSong();
					})
		},
		
		
		insertFigureToSong(){
			let vm = this;
			if (!vm.selectedFigure.DATA){
				return;
			}
			axios.get(vm.dataURL + 'method=addFigureToSong&titleKey=' + vm.songID + '&figureid=' + vm.selectedFigure.DATA)
					.then(function (){
						vm.getFiguresForSong();
					})
		},
		
		getFiguresForSong(){
			let vm = this;
			axios.get(vm.dataURL + 'method=getFiguresForSong&titleKey=' + vm.songID)
					.then(function (result){
						vm.figuresForSongArray = result.data.results;
					})
		},
		
		getFigures(){
			let vm = this;
			axios.get(vm.dataURL + 'method=getFigures')
					.then(function (result){
						vm.figuresArray = result.data.results;
					})
		},
		
		insertNewGameType(){
			let vm = this;
			if (!vm.selectedGameType){
				return;
			}
			axios.get(vm.dataURL + 'method=insertGameTypeForSong&TitleKey=' + vm.songID + '&GameTypeKey=' + vm.selectedGameType.DATA + '&SubGameTypeKey=' + vm.selectedSubGameType.DATA)
					.then(function (){
						vm.getGameTypesForSong();
						vm.gameTypeSelected = false;
						vm.selectedGameType = '';
						vm.selectedSubGameType = '';
					})
		},
		
		deleteGameType(){
			let vm = this;
			axios.get(vm.dataURL + 'method=deleteGameTypeForSong&id=' + vm.gameTypeObjectForSong.ID)
					.then(function (){
						vm.gameTypeSelected = false;
						vm.getGameTypesForSong();
					})
			
		},
		
		handleFigureClick(id,label){
			let vm = this;axios.get(vm.dataURL + 'method=getFigureObject&id=' + id)
					.then(function (result){
						vm.songFigureArray = result.data.results;
						vm.songFigureObject = vm.songFigureArray[0];
						vm.figureSelected = true;
						vm.selectedFigureName = label ;
						
					})
		},
		
		handleGameTypeClick(tableKey){
			let vm = this;
			axios.get(vm.dataURL + 'method=getGameTypeObject&tableKey=' + tableKey )
					.then(function (result){
						vm.gameTypeArrayForSong = result.data.results;
						vm.gameTypeObjectForSong = vm.gameTypeArrayForSong[0];
						vm.selectedGameTypeName = vm.gameTypeObjectForSong.GAMETYPE
						vm.selectedSubGameTypeName = vm.gameTypeObjectForSong.SUBGAMETYPE
						vm.gameTypeSelected = true;
					})
		},
		
		getSubGameTypes(){
			let vm = this;
			axios.get(vm.dataURL + 'method=getRelatedGameTypes&gameTypeKey=' + vm.selectedGameType.DATA)
					.then(function (result){
						vm.subGamesTypesArray = result.data.results;
					})
		},
		
		getGameTypesForSong(){
			let vm = this;
			axios.get(vm.dataURL + 'method=getGamesForSong&titleKey=' + vm.songID)
					.then(function (result){
						vm.gameTypesArrayForSong = result.data.results;
						
					})
		},
		
		getGameTypes(){
			let vm = this;
			axios.get(vm.dataURL + 'method=getGameTypes')
					.then(function (result){
						vm.gameTypesArray = result.data.results;
					})
		},
		
		deleteSongType(){
			let vm = this;
			axios.get(vm.dataURL + 'method=deleteSongTypeForSong&id=' + vm.selectedSongTypeRow)
					.then(function (){
						vm.songTypeSelected = false;
						vm.getSongTypesForSong();
					})
		},
		
		handleSongTypeClick(id,songType){
			let vm = this;
			vm.songTypeSelected = true;
			vm.selectedSongTypeRow = id;
			vm.selectedSongTypeName = songType;
		},
		
		addSongType(){
			let vm = this;
			vm.songTypeSelected = false;
			axios.get(vm.dataURL + 'method=insertSongTypeForSong&titleKey=' + vm.songID+ '&songTypeKey=' + vm.selectedSongType.DATA)
					.then(function (){
						vm.getSongTypesForSong();
							}
					)
		},
		
		getSongTypes(){
			let vm = this;
			axios.get(vm.dataURL + 'method=getSongTypes' )
					.then(function (result){
						vm.songTypesArry = result.data.results;
					})
		},
		
		
		getSongTypesForSong(){
			let vm = this;
			axios.get(vm.dataURL + 'method=getSongTypesForSong&titleKey=' + vm.songID)
					.then(function (result){
						vm.songTypesArrayForSong = result.data.results;
						vm.getSongTypes();
						vm.getGameTypes();
						vm.getGameTypesForSong();
						vm.getFigures();
						vm.getFiguresForSong();
						vm.getSubjects();
						vm.getSubjectsForSong();
						vm.getPartWorkArray();
						vm.getPartWorkForSong();
					})
		},
		
		insertMotive(){
			let vm = this;
			axios.get(vm.dataURL + 'method=insertMotive&titleID=' + vm.songID + '&motive=' + vm.motiveObject.MOTIVE)
					.then(function (){
						vm.getMotivesForSong();
						vm.addMotive = false;
						vm.motiveObject.MOTIVE ='';
					})
			
		},
		
		getGrades(){
			let vm = this;
			axios.get(vm.dataURL + 'method=getGrades&titleKey=' + vm.songID)
					.then(function (result){
						vm.gradesArray = result.data.results;
						vm.gradeObject = vm.gradesArray[0];
					})
		},
		
		saveGrades(){
			let vm = this;
			vm.gradeObject.TITLEKEY = vm.songID;
			window.$.ajax({
				type: "post",
				url: vm.dataURL,
				dataType: "json",
				data: {
					method: "saveGrades",
					gradeObject: JSON.stringify(vm.gradeObject)
				},
				success: function () {
					vm.text = 'Grade Info. Saved';
					vm.snackbar = true;
				},
				error: function (jqXHR, exception) {
					var msg = "";
					if (jqXHR.status === 0) {
						msg = "Not connect.\n Verify Network.";
					} else if (jqXHR.status == 404) {
						msg = "Requested page not found. [404]";
					} else if (jqXHR.status == 500) {
						msg = "Internal Server Error [500].";
					} else if (exception === "parsererror") {
						msg = "Requested JSON parse failed.";
					} else if (exception === "timeout") {
						msg = "Time out error.";
					} else if (exception === "abort") {
						msg = "Ajax request aborted.";
					} else {
						msg = "Uncaught Error.\n" + jqXHR.responseText;
					}
					alert(msg);
				}
			});
		},
		deleteMotive(){
			let vm = this;
			axios.get(vm.dataURL + 'method=deleteMotive&titleID=' + vm.songID + '&motive=' + vm.motiveObject.MOTIVE)
					.then(function (){
						vm.getMotivesForSong();
						vm.editMotive = false;
					})
		},
		
		
		handleMotiveClick(title,motive){
			let vm = this;
			axios.get(vm.dataURL + 'method=getMotive&titleID=' + title + '&motive=' + motive)
					.then(function (result){
						vm.motiveArray = result.data.results;
						vm.motiveObject = vm.motiveArray[0];
						vm.editMotive = true;
					})
			
		},
		
		clearRhythmContexts(){
			this.rhythmicContextObject.REARLY =false;
			this.rhythmicContextObject.RYTHMKEY ='';
			this.rhythmicContextObject.RLATE=false;
			this.rhythmicContextObject.RMIDDLE=false;
			this.rhythmicContextObject.RPREPARATION=false;
			this.rhythmicContextObject.RYTHNAME='';
			
		},
		
		setRythmContextAddMode(){
			this.addRhythymicMode = true;
			this.editRhythymicMode = false;
			this.clearRhythmContexts();
		},
		
		deleteRhythmicContext(){
			let vm = this;
			axios.get(vm.dataURL + 'method=deleteRhythmicContext&id=' + vm.rhythmicContextObject.ID)
					.then(function (){
						vm.rhythmClick();
						vm.editRhythymicMode = false;
						vm.clearRhythmContexts();
					})
		},
		
		getRhythmicContexts(){
			let vm = this;
			axios.get(vm.dataURL + 'method=getRythmicContexts')
					.then(function (result){
						vm.rhythmicContextsArray=result.data.results;
					})
		},
		
		rhythmClick(){
			let vm = this;
			vm.addRhythymicMode = false;
			vm.editRhythymicMode = false;
			axios.get(vm.dataURL + 'method=getRythmicContextsForSong&titleKey=' + vm.songID)
					.then(function (result){
						vm.songRhythmicElementsArray = result.data.results;
					});
			vm.getRhythmicContexts();
			vm.clearRhythmContexts();
			vm.getMotivesForSong();
		},
		motiveClick(){
			let vm = this;
			vm.getMotivesForSong();
		},

		getMotivesForSong(){
			let vm = this;
			axios.get(vm.dataURL + 'method=getMotivesForSong&titleKey=' + vm.songID)
					.then(function (result){
						vm.motivesForSongArray = result.data.results;
					})
		},

		delMelContext(){
			let vm = this;
			axios.get(vm.dataURL + 'method=deleteMelodicContext&id=' + vm.songMelodicContextObject.ID)
					.then(function (){
						vm.pedagogyClick();
						vm.addMelContextMode= false;
						vm.clearMelContextObject();
					})
		},
		
		insertNewRhythmicContext(){
			let vm = this;
			vm.rhythmicContextObject.TITLEKEY = vm.songID;
			vm.rhythmicContextObject.RYTHMKEY = vm.rhythmicContextObject.RYTHMNAME.ID
			window.$.ajax({
				type: "post",
				url: vm.dataURL,
				dataType: "json",
				data: {
					method: "insertNewRhythmicContext",
					rhythmicContext: JSON.stringify(vm.rhythmicContextObject)
				},
				success: function () {
					
					vm.rhythmClick();
					vm.addRhythymicMode = false;
					vm.clearRhythmContexts();
					
					
					
				},
				error: function (jqXHR, exception) {
					var msg = "";
					if (jqXHR.status === 0) {
						msg = "Not connect.\n Verify Network.";
					} else if (jqXHR.status == 404) {
						msg = "Requested page not found. [404]";
					} else if (jqXHR.status == 500) {
						msg = "Internal Server Error [500].";
					} else if (exception === "parsererror") {
						msg = "Requested JSON parse failed.";
					} else if (exception === "timeout") {
						msg = "Time out error.";
					} else if (exception === "abort") {
						msg = "Ajax request aborted.";
					} else {
						msg = "Uncaught Error.\n" + jqXHR.responseText;
					}
					alert(msg);
				}
			});
		},
		
		insertNewMelContext(){
			let vm = this;
			vm.songMelodicContextObject.TITLE_KEY = vm.songID;
			window.$.ajax({
				type: "post",
				url: vm.dataURL,
				dataType: "json",
				data: {
					method: "insertMelodicContext",
					MelodicContext: JSON.stringify(vm.songMelodicContextObject)
				},
				success: function () {
					
					vm.pedagogyClick();
					vm.addMelContextMode= false;
					vm.clearMelContextObject();
					
					
					
				},
				error: function (jqXHR, exception) {
					var msg = "";
					if (jqXHR.status === 0) {
						msg = "Not connect.\n Verify Network.";
					} else if (jqXHR.status == 404) {
						msg = "Requested page not found. [404]";
					} else if (jqXHR.status == 500) {
						msg = "Internal Server Error [500].";
					} else if (exception === "parsererror") {
						msg = "Requested JSON parse failed.";
					} else if (exception === "timeout") {
						msg = "Time out error.";
					} else if (exception === "abort") {
						msg = "Ajax request aborted.";
					} else {
						msg = "Uncaught Error.\n" + jqXHR.responseText;
					}
					alert(msg);
				}
			});
		},
		
		setMelContextAddMode(){
			this.editMelContextMode = false;
			this.addMelContextMode= true;
			this.clearMelContextObject();
		},

		clearMelContextObject(){
			let vm=this;

			vm.songMelodicContextObject.MELODICCONTEXTKEY = 0;
			vm.songMelodicContextObject.MELODICELEMENTKEY = 0;
			vm.songMelodicContextObject.MPREPARATION = 0;
			vm.songMelodicContextObject.MEARLYPRACTICE = 0
			vm.songMelodicContextObject.MMIDDLEPRACTICE = 0
			vm.songMelodicContextObject.MLATEPRACTICE = 0;

		},

		saveRhythmicContextEdits(){
			let vm = this;
			vm.rhythmicContextObject.TITLEKEY = vm.songID;
			window.$.ajax({
				type: "post",
				url: vm.dataURL,
				dataType: "json",
				data: {
					method: "updateRhythmicContext",
					rhythmicContext: JSON.stringify(vm.rhythmicContextObject)
				},
				success: function () {
					
					vm.rhythmClick();
					vm.editRhythymicMode= false;
					vm.clearRhythmContexts();
					
				},
				error: function (jqXHR, exception) {
					var msg = "";
					if (jqXHR.status === 0) {
						msg = "Not connect.\n Verify Network.";
					} else if (jqXHR.status == 404) {
						msg = "Requested page not found. [404]";
					} else if (jqXHR.status == 500) {
						msg = "Internal Server Error [500].";
					} else if (exception === "parsererror") {
						msg = "Requested JSON parse failed.";
					} else if (exception === "timeout") {
						msg = "Time out error.";
					} else if (exception === "abort") {
						msg = "Ajax request aborted.";
					} else {
						msg = "Uncaught Error.\n" + jqXHR.responseText;
					}
					alert(msg);
				}
			});
		},

		selectMelodicContext(){
			let vm=this;
			vm.songMelodicContextObject.MELODICCONTEXTKEY = vm.songMelodicContextObject.MELODICCONTEXTKEY.DATA;
		},

		getCorrectContext(){
			let vm=this;
			console.log(vm.songMelodicContextObject.MELODICCONTEXTKEY.DATA);
			axios.get(vm.dataURL+ 'method=getMelContextsForElement&element=' + vm.songMelodicContextObject.MELODICELEMENTKEY.DATA)
						.then(function (result){
							vm.availableMelContextsArray = result.data.results;
						})
		},


		getCorrectContextOnLoad(){
			let vm=this;
			console.log(vm.songMelodicContextObject.MELODICCONTEXTKEY);
			axios.get(vm.dataURL+ 'method=getMelContextsForElement&element=' + vm.songMelodicContextObject.MELODICELEMENTKEY)
					.then(function (result){
						vm.availableMelContextsArray = result.data.results;
					})
		},

		handleMelodicClick(id){
			let vm=this;

			axios.get(vm.dataURL + 'method=getMelodicContectRecord&melContextRecord=' + id)
					.then(function (result){
						vm.songMelodicContextArray = result.data.results;
						vm.songMelodicContextObject = vm.songMelodicContextArray[0];
						vm.getCorrectContextOnLoad();
						vm.editMelContextMode = true;
						vm.addMelContextMode = false;
					})
		},
		
		updateMelodicContext(){
			let vm=this;
			window.$.ajax({
				type: "post",
				url: vm.dataURL,
				dataType: "json",
				data: {
					method: "updateMelodicContext",
					MelodicContext: JSON.stringify(vm.songMelodicContextObject)
				},
				success: function () {
					
					vm.pedagogyClick();
					vm.editMelContextMode= false;
					
					
				},
				error: function (jqXHR, exception) {
					var msg = "";
					if (jqXHR.status === 0) {
						msg = "Not connect.\n Verify Network.";
					} else if (jqXHR.status == 404) {
						msg = "Requested page not found. [404]";
					} else if (jqXHR.status == 500) {
						msg = "Internal Server Error [500].";
					} else if (exception === "parsererror") {
						msg = "Requested JSON parse failed.";
					} else if (exception === "timeout") {
						msg = "Time out error.";
					} else if (exception === "abort") {
						msg = "Ajax request aborted.";
					} else {
						msg = "Uncaught Error.\n" + jqXHR.responseText;
					}
					alert(msg);
				}
			});
		},
		
		handleRhythmicClick(id){
			let vm=this;
		
			axios.get(vm.dataURL + 'method=getRhythmicContext&id='+ id)
					.then(function (result){
						vm.rhythmicContextArray = result.data.results;
						vm.rhythmicContextObject = vm.rhythmicContextArray[0];
					})
			vm.editRhythymicMode = true;
			vm.addRhythymicMode  =false;
		},

		pedagogyClick(){
			let vm=this;
			axios.get(vm.dataURL+'method=getMelodicElements')
					.then(function (result){
						vm.melodicElementsArray = result.data.results;
					})
			axios.get(vm.dataURL + 'method=getMelodicContextsForSong&titleKey=' + vm.songID )
					.then(function (result){
						vm.songMelodicElementsArrays = result.data.results;
					})
			// vm.getCorrectContextOnLoad();
		},
		getSongDetails(id){
			let vm=this;
			axios.get(vm.dataURL+'method=getSongDetails&songID=' + id)
					.then(function (result){
						vm.songArray = result.data.results;
						vm.songObject = vm.songArray[0];
						vm.songPDFLocation = 'https://kodalycollection.org/scores/' + vm.songObject.NOTATION_FILE_NAME + '.pdf';
						vm.soundFile  = 'https://kodalycollection.org/audio/' +  vm.songObject.NOTATION_FILE_NAME + '.mp3';
						
					})
			},
		getStates(){
			let vm=this;
			axios.get(vm.dataURL+'method=getStates')
					.then(function (result){
						vm.statesArray = result.data.results;
					})
		},
		getRegions(){
			let vm=this;
			axios.get(vm.dataURL+'method=getRegions')
					.then(function (result){
						vm.regionsArray = result.data.results;
					})
		},
		getEthnicities(){
			let vm=this;
			axios.get(vm.dataURL+'method=getEthnicity')
					.then(function (result){
						vm.ethnicityArray = result.data.results;
					})
		},
		getTonalCenters(){
			let vm=this;
			axios.get(vm.dataURL+'method=getNotes')
					.then(function (result){
						vm.notesArray = result.data.results;
					})
		},
		getRanges(){
			let vm=this;
			axios.get(vm.dataURL + 'method=getRange')
					.then(function (result){
						vm.rangeArray = result.data.results;
					})
		} ,
		getScales(){
			let vm=this;
			axios.get(vm.dataURL + 'method=getScales')
					.then(function (result){
						vm.scaleArray = result.data.results;
					})
		},
		getStartingPitches(){
			let vm=this;
			axios.get(vm.dataURL + 'method=getStartingPitch')
					.then(function (result){
						vm.startingPitchArray = result.data.results;
					})
		},
		getFormTypes(){
			// general forms
			let vm=this;
			axios.get(vm.dataURL + 'method=getFormTypes')
					.then(function (results){
						vm.formTypesArray = results.data.results;
					})
		},
		getForms(){
			//aaba forms
			let vm=this;
			axios.get(vm.dataURL + 'method=getForms')
					.then(function (result){
						vm.formArray = result.data.results;
					})
		},
		getMeters(){
			let vm=this;
			axios.get(vm.dataURL + 'method=getMeters')
					.then(function (results){
						vm.metersArray = results.data.results;
					})
		},
		getGeneralCommunities(){
			let vm=this;
			axios.get(vm.dataURL + 'method=getGeneralCommunities')
					.then(function (results){
						vm.generalCommunitiesArray = results.data.results;
					})
		},
		clearSongObject(){
			let vm=this;
			vm.songObject.PUBLICATION='';
			vm.songObject.COMMENTS='';
			vm.songObject.SONG_BACKGROOUND='';
			vm.songObject.FIRST_LINE_TEXT='';
			vm.songObject.TITLE = '';
			vm.songObject.ALT_TITLE_1 = '';
			vm.songObject.ALT_TITLE_2 = '';
			vm.songObject.INFORMANT=''
			vm.songObject.STATEID = 0;
			vm.songObject.REGIONID = 0;
			vm.songObject.ETHNICITYID = 0;
			vm.songObject.ANALYZED = 0;
			vm.songObject.INFINALE = 0;
			vm.songObject.PROOFED_FLAG = 0;
			vm.songObject.IP_STATUS = 0;
			vm.songObject.LOC = false;
			vm.songObject.CHILD = 0;
			vm.songObject.RECORDING_FLAG = 0;
			vm.songObject.GAME = 0;
			vm.songObject.PUBLISH = 0;
			vm.songObject.NOTATION_FILE_NAME = '';
			
		},
	},
	created() {
		this.songID =  this.$route.params.id;
		
		this.getStates();
		this.getRegions();
		this.getEthnicities();
		this.getTonalCenters();
		this.getRanges();
		this.getScales();
		this.getStartingPitches();
		this.getFormTypes();
		this.getMeters();
		this.getForms();
		this.getGeneralCommunities();
		this.prepareUppy();
		if (this.songID > 0){
			this.getSongDetails(this.songID);
			this.editMode=true;
			this.addMode=false;
		} else{
			this.clearSongObject();
			this.editMode=false;
			this.addMode=true;
		}
	
	
	},
	mounted() {
		const uppy = new Uppy({
			id:'uppy'
		})
				
				
				.use(Dashboard, {
					inline: true,
					trigger: '.UppyModalOpenerBtn',
					target:'#uppy',
					height: 150,
					width:200,
					showProgressDetails: true,
				})
				.use(XHRUpload, { endpoint: 'https://kodalycollection.org/uploadPDF.cfm' })
		
		uppy.on('complete', (result) => {
			console.log('Upload complete! We’ve uploaded these files:', result.successful)
		})
		console.log(uppy);
		
		const uppy2 = new Uppy({
			id:'uppy2'
		})
				
				
				.use(Dashboard, {
					inline: true,
					trigger: '.UppyModalOpenerBtn',
					target:'#uppy2',
					height: 150,
					width:200,
					showProgressDetails: true,
				})
				.use(XHRUpload, { endpoint: 'https://kodalycollection.org/uploadAudio.cfm'})
		
		uppy.on('complete', (result) => {
			console.log('Upload complete! We’ve uploaded these files:', result.successful)
		})
		console.log(uppy2);
	}
}
</script>

<style scoped>
hr {
	transform: rotate(90deg);
}
.vue-pdf-embed{
	margin-top: 20px;
}
</style>
