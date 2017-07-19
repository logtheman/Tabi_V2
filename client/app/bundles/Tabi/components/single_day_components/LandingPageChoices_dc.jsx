import React from 'react'

const LandingPageChoices = props => {
	return(
		<div className="container pt-3">
			<div className="center-block button-container">
				<div className="open-buttons">
					<button
						type="button"
						onClick={props.handleNewTrip}
						className="btn btn-outline-primary btn-block new-trip mt-4"
					>
						<i className="fa fa-plus " aria-hidden="true" />
						{" "}Plan a trip
					</button>
					<button
						type="button"
						className="btn btn-outline-success btn-block edit-trip mt-3"
					>
						<i className="fa fa-pencil-square-o " aria-hidden="true" />
						{" "}Edit exiting trip
					</button>
					<button
						type="button"
						className="btn btn-outline-danger btn-block explore-trips mt-3"
					>
						<i className="fa fa-eye" aria-hidden="true" />
						{" "}Explore trips
					</button>
				</div>
			</div>
		</div>
	)
}

export default LandingPageChoices;