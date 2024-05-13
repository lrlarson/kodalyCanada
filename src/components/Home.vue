<template>
<v-container>
	<v-card>
		<v-card-title class="justify-center">
			HOME
		</v-card-title>
	</v-card>
	<v-row style="margin-top: 20px">
		<v-col md4>
			<v-btn @click="gotSoSongs">All Songs</v-btn>
		</v-col>
		<v-col md4>
			<v-btn @click="gotToNews">News</v-btn>
		</v-col>
	</v-row>
</v-container>
</template>

<script>
import router from "@/router";
export default {
	name: "Home",
	methods:{
		gotSoSongs(){
			router.push({name:"SongsHome"});
		},
		gotToNews(){
			router.push({name:'news'});
		},
	}
}
</script>

<style scoped>

</style>
