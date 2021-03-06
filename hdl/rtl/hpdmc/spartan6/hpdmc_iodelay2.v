/*
 * Milkymist SoC
 * Copyright (C) 2007, 2008, 2009 Sebastien Bourdeauducq
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

module hpdmc_iodelay2 #(
	parameter ODELAY_VALUE = 30
) (
	/* pad -> fabric */
	input [1:0] IDATAIN,
	output [1:0] DATAOUT,
	/* fabric -> pad */
	input [1:0] T,
	output [1:0] TOUT,
	input [1:0] ODATAIN,
	output [1:0] DOUT,
	/* control pins */
	input INC,
	input CE,
	input RST,
	input CAL,
	input CLK,
	input IOCLK0,
	input IOCLK1
);

IODELAY2 #(
	.DELAY_SRC("IO"),
	.IDELAY_TYPE("VARIABLE_FROM_ZERO"),
	.DATA_RATE("DDR"),
	.ODELAY_VALUE(ODELAY_VALUE)
) idelay0 (
	.IDATAIN(IDATAIN[0]),
	.DATAOUT(DATAOUT[0]),
	.T(T[0]),
	.TOUT(TOUT[0]),
	.ODATAIN(ODATAIN[0]),
	.DOUT(DOUT[0]),
	
	.INC(INC),
	.CE(CE),
	.RST(RST),
	.CLK(CLK),
	.IOCLK0(IOCLK0),
	.IOCLK1(IOCLK1),
	.CAL(CAL)
);
IODELAY2 #(
	.DELAY_SRC("IO"),
	.IDELAY_TYPE("VARIABLE_FROM_ZERO"),
	.DATA_RATE("DDR"),
	.ODELAY_VALUE(ODELAY_VALUE)
) idelay1 (
	.IDATAIN(IDATAIN[1]),
	.DATAOUT(DATAOUT[1]),
	.T(T[1]),
	.TOUT(TOUT[1]),
	.ODATAIN(ODATAIN[1]),
	.DOUT(DOUT[1]),
	
	.INC(INC),
	.CE(CE),
	.RST(RST),
	.CLK(CLK),
	.IOCLK0(IOCLK0),
	.IOCLK1(IOCLK1),
	.CAL(CAL)
);

endmodule
