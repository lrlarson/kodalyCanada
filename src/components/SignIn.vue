<template>
	<v-container>
		<v-container grid-list-md text-xs-center>
			<v-card-text class="page-title">Sign In</v-card-text>
			<v-text-field v-model="email" label="email"></v-text-field>
			<v-text-field
					v-model="pword"
					label="password"
					type="password"
			></v-text-field>
			<v-btn color="success" @click="signIn">Click</v-btn>
			
			<v-card-text>{{ secureMessage }}</v-card-text>
		</v-container>
	</v-container>
</template>

<script>
import {eventBus} from "@/main";
import store from "@/store";
import axios from "axios";
import router from "@/router";


export default {
	data: () => ({
		dataURL: "https://kodalycollection.org/data/kodaly_canadaVue.cfc?",
		email: "",
		pword: "",
		secureMessage: ""
	}),
	name: "SignIn" ,
	methods:{
		signIn: function() {
			var vm = this;
			console.log("signin");
			window.$.ajax({
				type: "post",
				url: vm.dataURL,
				dataType: "json",
				data: {
					method: "checkSecure",
					email: vm.email,
					pword: vm.pword
				},
				success: function(d){
					if (d.results.length > 0) {
						eventBus.$emit("signedIn");
						vm.mutateAuthentication();
						vm.secureMessage = "logged in";
						vm.$user.copy({
							name: vm.email,
							logged:true
						})
						vm.logInUser();
						console.log(vm.$user.name,vm.$user.logged);
						router.push({name: "Home"});
					} else {
						eventBus.$emit("signInFail");
						vm.secureMessage = "incorrect login";
					}
				},
				error: function (e) {
					console.log(e);
				}
			});
		},
		mutateAuthentication(){
			store.commit("makeAuthenticated");
		},
		logInUser(){
			let vm = this;
			axios.get(vm.dataURL+ 'method=logInUser&user=' + vm.email);
		}
	}
}
</script>

<style scoped>

</style>

