{smcl}

{title:           Command {cmd:jeffc2} and its use}

{p}This file is intended to be a help file for the user written command
{bf:jeffc2}, a program that is intended to 'center' the values
of a list of {bf:numeric} variables in a database.
{p_end}


{p}
This command is not particularly useful in itself, but it was
written with a view to practising techniques of programming in {bf:STATA}.
To that end, I think that it has succeeded.
{p_end}

{hline}

{bf: Now for some testing ...}

{p}
In the section below, I will demonstrate the syntax of the {it:jeffc2} 
command. Pay careful attention to the details - it will pay off in the end!

{cmd}
jeffc2 varlist, {cmdab:gen:erate}(prefix)

{inp}jeffc2 varlist, gen(prefix)

{title:Function Returns}

{p}
This is an {it:r-class function} and it returns its values in the usual
r-matrix.
For the purposes of the current command, there are two matrices returned:

r(mean)
r(variance)

{p}
... and these matrices contain the mean and variance for {it:each} numerical
variable in the varlist. It is also possible to {hi:highlight} certain words
within the text, or to



{title:   EXPERIMENTAL SECTION}
{hline}

{error} This is a test error message.

{hi}Highlight entire lines.


