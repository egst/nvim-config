require 'helpers'

-- General:
snippet('doc', [[O/**<Cr><Cr>/<Esc>kA  ]])

-- C++:
-- header file init:
snippet('hpp', [[i#pragma once<Cr><Cr>namespace Ns {<Cr><Cr>}<Esc>2kwcw]])
-- inspect (esl):
snippet('civ', [[oESL_INSPECT();<Esc>hi]])
snippet('cit', [[oESL_INSPECT_TYPE();<Esc>hi]])
-- cout:
snippet('co', [[ostd::cout << "" << "\n";<Esc>3Ba]])

-- PHP:
-- class file init:
snippet('php', [[i<?php declare(strict_types = 1);<Cr><Cr>namespace Ns;<Cr><Cr>class Cls {<Cr><Cr>}<Esc>4kwcw]])
-- inline echo inject:
snippet('piE', [[i<?=  ?><Esc>hhi]])
snippet('pie', [[a<?=  ?><Esc>hhi]])
-- inspect (psalm):
snippet('pit', [[o/** @psalm-trace  */;<Esc>Bhi]])

-- PeoplePath:
-- log:
--snippet('ppl', [[o\IW\Core\Log::getLogger(self::class)->info('--- | VAR | ' . var_export(, true)); //TODO: remove<Esc>3Bba]])
--snippet('ppl', [[o\IW\Core\Log::getLogger(__FILE__)->info('--- | VAR | ' . var_export(, true)); //TODO: remove<Esc>3Bba]])
snippet('ppl', [[o\IW\My\Log::dump();<Esc>hi]])

-- TeX:
-- inline verbatim:
snippet('tiv', [[a\verb||<Esc>i]])
-- bold:
snippet('tbf', [[a\textbf{}<Esc>i]])
-- italics:
snippet('tit', [[a\textit{}<Esc>i]])
