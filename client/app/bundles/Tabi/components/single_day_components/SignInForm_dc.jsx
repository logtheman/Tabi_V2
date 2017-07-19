import React from "react";
import Radium from "radium";

const SignInForm = props => {
	const style = {
		formContainer: {
			backgroundColor: "rgba(250, 250, 250, .8)",
			borderRadius: "3px",
			paddingTop: "3em",
		},
		submitButton: {
			width: "100%"
		},
		socialButtons: {
			width: "80%",
			color: "white",
			"@media (minWidth: 700px)": {
				width: "40%"
			}
		}
	};

	return (
		<div className="row pb-2">
			<div className="container col-sm-4 offset-sm-4" style={style.formContainer}>
			<div className="row">
				<div className="col-md-10 offset-md-1">
					<form>
						<div className="form-group mb-2">
							<input
								type="email"
								className="form-control input-colored"
								id="email"
								placeholder="Email"
							/>
						</div>
						<div className="form-group pt-1">
							<input
								type="password"
								className="form-control input-colored"
								id="password"
								placeholder="Password"
							/>
						</div>
						<button
							type="submit"
							className="btn btn-primary"
							style={style.submitButton}
						>
							Sign In
						</button>
					</form>
					<div className="row pt-2">
						<div className="col-12">
							<a href="a">Sign Up</a>
						</div>
						<div className="col-12">
							<a href="a">Forgot your password? </a>
						</div>
					</div>
				</div>
			</div>
			<div className="row mt-4">
				<div className="col-md-10 offset-md-1">
					<a
						className="btn btn-social btn-facebook mb-2"
						style={style.socialButtons}
					>
						<span className="fa fa-facebook" /> Sign in with Facebook
					</a>
					<br />
					<a
						className="btn btn-social btn-twitter mb-2"
						style={style.socialButtons}
					>
						<span className="fa fa-twitter" />
						Sign in with Twitter
					</a>
					<br />
					<a
						className="btn btn-social btn-google mb-2"
						style={style.socialButtons}
					>
						<span className="fa fa-google" /> Sign in with Google{" "}
					</a>
				</div>
			</div>
			</div>
		</div>
	);
};

export default SignInForm;