import React, {PropTypes} from "react";
import DatePicker from 'react-datepicker';
import VirtualizedSelect from "react-virtualized-select";
import moment from 'moment';
import { Modal } from "react-bootstrap";


import FlightResultsList from "./FlightResultsList_dc";

import 'react-datepicker/dist/react-datepicker.css';
import "react-select/dist/react-select.css";
import "react-virtualized/styles.css";
import "react-virtualized-select/styles.css";
import createFilterOptions from "react-select-fast-filter-options";



const FlightForm = ({departureDate, returnDate, handleChangeDepartureDate, handleChangeReturnDate, 
		airportFilterOptions, depatureAirport, airports, handleDepatureAirport, destinationAirport, handleDestinationAirport, selectedAirlines, 
		options, handleAirlines, handleActiveClass, handleTimeOfDayChange, onClose, filterOptions, results, displaySelectedFlights, flightSearchButton}) => {
	return (
		<div>
			<form>
				<div className="row">
					<div className="col-md-6">	
						<div className="form-group">
							<label htmlFor="departureDate" style={{width:"100%"}}>
								Leaving on
							</label>

							<DatePicker
							    selected={departureDate}
							    selectsStart
							    startDate={departureDate}
							    endDate={returnDate}
							    onChange={handleChangeDepartureDate}
							/>
						</div>
					</div>
					<div className="col-md-6">	
						<div className="form-group" >
							<label htmlFor="returnDate" style={{width:"100%"}}>
								Returning on
							</label>
							<DatePicker
							    selected={returnDate}
							    selectsEnd
							    startDate={departureDate}
							    endDate={returnDate}
							    onChange={handleChangeReturnDate}
							/>
						</div>
					</div>
				</div>
				<div className="row">
					<div className="col-md-12	">
						<div className="form-group">
							<label htmlFor="origin">Depaturing from</label>
							<VirtualizedSelect
								filterOptions={airportFilterOptions}
								value={depatureAirport}
								options={airports}
								onChange={handleDepatureAirport}
								className="select-input"
							/>
						</div>
					</div>
				</div>
				<div className="row">
					<div className="col-md-12">
						<div className="form-group">
							<label htmlFor="destination">Going to</label>
							<VirtualizedSelect
								filterOptions={airportFilterOptions}
								value={destinationAirport}
								options={airports}
								onChange={handleDestinationAirport}
								className="select-input"
							/>
						</div>
					</div>
				</div>
				<div className="row">
					<div className="col-md-12">
						<div className="form-group">
							<label htmlFor="airlines">Airlines 
								<span className="optional-label"> 
									 {' '}(optional) 
								</span>
							</label>
							<VirtualizedSelect
								filterOptions={filterOptions}
								value={selectedAirlines}
								options={options}
								onChange={handleAirlines}
								className="select-input"
							/>
						</div>
					</div>
				</div>
				<div className="row">
					<div className="col-md-12">
						<div className="form-group">
							<label htmlFor="timeOfDay">Time of Day
								<span className="optional-label"> 
									 {' '}(optional)
								</span>
							</label><br />
						<div className="btn-group" data-toggle="buttons" >
						  <label className={handleActiveClass('00:00')}>
						    <input type="radio" 
						    	onClick={() => handleTimeOfDayChange('any')} 
						    	/> Any Time
						  </label>
						  <label className={handleActiveClass('00:01')}>
						    <input type="radio" 
						    	onClick={() => handleTimeOfDayChange('morning')} 

						    	/> Morning
						  </label>
						  <label className={handleActiveClass('12:00')}>
						    <input type="radio" onClick={() => handleTimeOfDayChange('afternoon')} /> Afternoon
						  </label>
						  <label className={handleActiveClass('17:00')}>
						    <input type="radio" onClick={() => handleTimeOfDayChange('evening')} /> Evening
						  </label>
						</div>
					</div>
				</div>
			</div>
				{results}

				{displaySelectedFlights}
				<Modal.Footer>
					{flightSearchButton}
					<button
						type="close"
						className="btn btn-secondary"
						onClick={() => onClose("")}
					>
						Close
					</button>
				</Modal.Footer>

			</form>
		</div>


	)

}

export default FlightForm;