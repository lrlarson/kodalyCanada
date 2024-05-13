<template>
	<v-container>
		<v-layout row wrap align-center>
			<v-flex >
				<v-card>
					<v-card-title class="justify-center" >
						NEWS
					</v-card-title>
					<v-card-text class="justify-center" >
						<v-btn @click="handleNewItemClick">
							Add News Item
						</v-btn>
					</v-card-text>
				</v-card>
			</v-flex>
		</v-layout>
		<v-row>
			<v-container grid-list-md >
				<v-data-table
						:headers="headers"
						:items="newsArray"
						:items-per-page="800"
						class="elevation-1"
						@click:row="handleClick">
					<template v-slot:item.NEWSITEMPOSTSWITCH="{ item }">
						<v-simple-checkbox
								v-model="item.NEWSITEMPOSTSWITCH"
								disabled
						></v-simple-checkbox>
					</template>
				</v-data-table>
			</v-container>
		</v-row>
		<v-container v-if="editMode || addMode">
		<v-row>
			<v-col md3>
				<v-text-field disabled label="Headline"></v-text-field>
				<ckeditor :editor="editor" v-model="newsObject.NEWSITEMHEADLINE" :config="editorConfig"></ckeditor>
			</v-col>
			<v-col md3>
				<v-text-field disabled label="Text"></v-text-field>
				<ckeditor :editor="editor" v-model="newsObject.NEWSITEMCOPY" :config="editorConfig"></ckeditor>
			</v-col>
		</v-row>
			<v-row>
				<v-col md1>
					<v-text-field v-model="newsObject.DATESTRING" label="Date String"></v-text-field>
				</v-col>
			</v-row>
			<v-row>
				<v-col md2>
					<v-text-field disabled label="Teaser"></v-text-field>
					<ckeditor :editor="editor" v-model="newsObject.NEWSTEASER" :config="editorConfig"></ckeditor>
				</v-col>
				<v-col md1>
					<v-checkbox v-model="newsObject.NEWSITEMPOSTSWITCH" label="Post"></v-checkbox>
				</v-col>
				
				<v-col md5>
					<v-date-picker v-model="picker" label="Publish Date"></v-date-picker>
				</v-col>
			</v-row>
			<v-row>
				<v-col md3 v-if="editMode">
					<v-btn color="green" @click="updateNewItem">Save Edits</v-btn>
				</v-col>
				<v-col md3 v-if="editMode" @click="deleteNewsItem">
					<v-btn color="red">Delete News Item</v-btn>
				</v-col>
				<v-col md3 v-if="addMode">
					<v-btn color="green" @click="saveNewNewsItem">Save New News Item</v-btn>
				</v-col>
			</v-row>
		</v-container>
	</v-container>
	
</template>

<script>
import axios from "axios";
import ClassicEditor from "@ckeditor/ckeditor5-build-classic";


export default {
	name: "News",
	data() {
		return{
			newsArray:[],
			newsObject:{} ,
			newsItemArray:[],
			picker: new Date().toISOString().substring(0,10),
			rowsPerPageItems: [50, 200],
			dataURL: "https://kodalycollection.org/kodalyVue/kodalyVue.cfc?",
			search:'',
			pagination: {
				rowsPerPage: 100,
				itemsPerPage:100,
			},
			headers: [
				
				{text: "Title", value: "NEWSITEMHEADLINE", sortable:true},
				{text: "Alt. Title", value: "DATESTRING", sortable:true},
				{text: "Publish", value: "NEWSITEMPOSTSWITCH", sortable:true},
			],
			editMode:false,
			addMode:false,
			editorConfig:{
			
			},
			editor: ClassicEditor,
			editorData: '',
		}
	},
	methods: {
		handleNewItemClick(){
			this.clearNewsObject();
			this.editMode = false;
			this.addMode=true;
			this.$vuetify.goTo(this.pageHeight);
		},
		
		clearNewsObject(){
			this.newsObject.DateString = ''
			this.newsObject.NEWSITEMCOPY = ''
			this.newsObject.NEWSITEMHEADLINE= ''
			this.newsObject.NEWSITEMPOSTSWITCH= 0
			this.newsObject.NEWSTEASER= ''
			this.newsObject.POSTDATE=null;
			
		},
		saveNewNewsItem(){
			let vm=this;
			vm.newsObject.POSTDATE = vm.picker;
			window.$.ajax({
				type: "post",
				url: vm.dataURL,
				dataType: "json",
				data: {
					method: "createNewsItem",
					newsItem: JSON.stringify(vm.newsObject)
				},
				success: function () {
					//vm.editsSaved = true;
					console.log('in success')
					vm.getNews();
					vm.addMode=false;
					// vm.clearEventObject();
					// vm.snackbar = true;
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
		deleteNewsItem(){
			let vm=this;
			axios.get(vm.dataURL+ 'method=deleteNewsItem&id=' + vm.newsObject.ID)
					.then(function (){
						vm.editMode = false;
						vm.getNews();
					})
		},
		updateNewItem() {
			let vm=this;
			vm.newsObject.POSTDATE = vm.picker;
			window.$.ajax({
				type: "post",
				url: vm.dataURL,
				dataType: "json",
				data: {
					method: "updateNewsItem",
					newsItem: JSON.stringify(vm.newsObject)
				},
				success: function () {
					//vm.editsSaved = true;
					console.log('in success')
					vm.getNews();
					vm.editMode = false;
					// vm.clearEventObject();
					// vm.snackbar = true;
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
		getNews() {
			let vm = this;
			axios.get(vm.dataURL + 'method=getNewsArray')
					.then(function (result) {
						vm.newsArray = result.data.results;
						for(let i = 0; i < vm.newsArray.length; i++){
							if (vm.newsArray[i].NEWSITEMPOSTSWITCH == 1){
								vm.newsArray[i].NEWSITEMPOSTSWITCH = true;
							} else{
								vm.newsArray[i].NEWSITEMPOSTSWITCH = false;
							}
						}
					})
		},
		handleClick: function (value) {
			let vm = this;
			axios.get(vm.dataURL + 'method=getNewsItem&ID=' + value.ID)
					.then(function (result) {
						vm.newsItemArray = result.data.results;
						vm.newsObject = vm.newsItemArray[0];
						vm.picker = vm.newsObject.POSTDATE;
						vm.editMode = true;
						vm.$vuetify.goTo(vm.pageHeight);
					})
		},
	},
	
	mounted() {
		this.getNews();
	},
	computed: {
		pageHeight () {
			return document.body.scrollHeight
		}
	}

}
</script>

<style scoped>
.ck.ck-editor {
	max-width: 450px!important;
}
</style>

